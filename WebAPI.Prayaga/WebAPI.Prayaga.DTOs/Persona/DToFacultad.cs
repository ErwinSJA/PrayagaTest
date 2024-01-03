using Swashbuckle.AspNetCore.Annotations;
using WebAPI.Prayaga.Util.Class;

namespace WebAPI.Prayaga.DTOs.Facultad
{
    [SwaggerSchema(Title = "DToFacultad", Required = new[] { "intIdFacultad", "strNombre", "strCodigo", "blnActivo", "strFechaCreacion", "strFechaActualizacion" })]
    public class DToFacultad
    {
        [SwaggerSchema(Title = "Id de Facultad", Description = "Identificador único de Facultad.", Format = "int", ReadOnly = true)]
        [SwaggerSchemaExample("0")]
        public int intIdFacultad { set; get; } = 0;

        [SwaggerSchema(Title = "Nombre Facultad", Description = "Nombre y Apellidos de la Facultad.", Format = "string")]
        [SwaggerSchemaExample("")]
        public string strNombre { set; get; } = string.Empty;

        [SwaggerSchema(Title = "Código de Facultad", Description = "Código Unico de Facultad", Format = "string")]
        [SwaggerSchemaExample("")]
        public string strCodigo { set; get; } = string.Empty;

        [SwaggerSchema(Title = "Estado", Description = "True:Activo | False:Inactivo", Format = "string", ReadOnly = true)]
        [SwaggerSchemaExample("")]
        public bool blnActivo { set; get; } = true;

        [SwaggerSchema(Title = "Fecha de creacion", Description = "", Format = "string", ReadOnly = true)]
        [SwaggerSchemaExample("")]
        public string strFechaCreacion { set; get; } = string.Empty;

        [SwaggerSchema(Title = "Fecha de actualizacion", Description = "", Format = "string", ReadOnly = true)]
        [SwaggerSchemaExample("")]
        public string strFechaActualizacion { set; get; } = string.Empty;
    }
}