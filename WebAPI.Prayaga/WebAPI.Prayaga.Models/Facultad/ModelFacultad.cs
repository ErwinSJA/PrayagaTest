using System.ComponentModel.DataAnnotations.Schema;

namespace WebAPI.Prayaga.Models.Facultad
{
    public class ModelFacultad
    {
        [Column("intIdFacultad")] public int intIdFacultad { set; get; } = 0;
        [Column("vchNombre")] public string strNombre { set; get; } = string.Empty;
        [Column("vchCodigo")] public string strCodigo { set; get; } = string.Empty;
        [Column("bitActivo")] public bool blnActivo { set; get; } = true;
        [Column("vchFechaCreacion")] public string strFechaCreacion { set; get; } = string.Empty;
        [Column("vchFechaActualizacion")] public string strFechaActualizacion { set; get; } = string.Empty;
    }
}
