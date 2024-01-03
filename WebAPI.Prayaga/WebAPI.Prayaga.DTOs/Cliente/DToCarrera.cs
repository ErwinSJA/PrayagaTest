using Swashbuckle.AspNetCore.Annotations;
using WebAPI.Prayaga.DTOs.Facultad;
using WebAPI.Prayaga.Util.Class;

namespace WebAPI.Prayaga.DTOs.Carrera
{
    [SwaggerSchema(Title = "DToCarrera", Required = new[] { "intIdFacultad", "intIdCarrera", "strNombre", "strCodigo", "strNombreCarrera", "strCodigoCarrera", 
        "blnActivoCarrera", "strFechaCreacionCarrera", "strFechaActualizacionCarrera" })]
    public class DToCarrera : DToFacultad
    {
        [SwaggerSchema(Title = "Id de Carrera", Description = "Identificador único de Carrera.", Format = "int", ReadOnly = true)]
        [SwaggerSchemaExample("0")]
        public int intIdCarrera { set; get; } = 0;

        [SwaggerSchema(Title = "Nombre Carrera", Description = "Nombre de la Carrera.", Format = "string")]
        [SwaggerSchemaExample("")]
        public string strNombreCarrera { set; get; } = string.Empty;

        [SwaggerSchema(Title = "Código de Carrera", Description = "Código Unico de Carrera", Format = "string")]
        [SwaggerSchemaExample("")]
        public string strCodigoCarrera { set; get; } = string.Empty;

        [SwaggerSchema(Title = "Estado", Description = "True:Activo | False:Inactivo", Format = "string", ReadOnly = true)]
        [SwaggerSchemaExample("")]
        public bool blnActivoCarrera { set; get; } = true;

        [SwaggerSchema(Title = "Fecha de creacion", Description = "", Format = "string", ReadOnly = true)]
        [SwaggerSchemaExample("")]
        public string strFechaCreacionCarrera { set; get; } = string.Empty;

        [SwaggerSchema(Title = "Fecha de actualizacion", Description = "", Format = "string", ReadOnly = true)]
        [SwaggerSchemaExample("")]
        public string strFechaActualizacionCarrera { set; get; } = string.Empty;
    }
}