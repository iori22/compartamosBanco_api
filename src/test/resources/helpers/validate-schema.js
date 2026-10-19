function(schemaJson, responseJson) {
  try {
    // Interop de Java desde Karate
    var SchemaValidator = Java.type('com.networknt.schema.JsonSchemaFactory');
    var SpecVersion = Java.type('com.networknt.schema.SpecVersion.VersionFlag');
    var ObjectMapper = Java.type('com.fasterxml.jackson.databind.ObjectMapper');

    // Instanciar la fábrica con la versión del Draft deseada (V7)
    var factory = SchemaValidator.getInstance(SpecVersion.V7);
    var jsonSchema = factory.getSchema(JSON.stringify(schemaJson));

    // Convertir la respuesta a Jackson JsonNode
    var mapper = new ObjectMapper();
    var responseNode = mapper.readTree(JSON.stringify(responseJson));

    // Ejecutar validación
    var errors = jsonSchema.validate(responseNode);

    // Si la lista de errores está vacía, el esquema es 100% válido
    if (errors.isEmpty()) {
      return { isValid: true, errors: [] };
    } else {
      // Extraer mensajes de error si los hay
      var errorList = [];
      var iterator = errors.iterator();
      while (iterator.hasNext()) {
        errorList.push(iterator.next().getMessage());
      }
      return { isValid: false, errors: errorList };
    }
  } catch (e) {
    return { isValid: false, errors: [e.message] };
  }
}