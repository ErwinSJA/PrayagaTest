using System.ComponentModel.DataAnnotations.Schema;
using WebAPI.Prayaga.Models.Facultad;

namespace WebAPI.Prayaga.Models.Carrera
{
    public class ModelCarrera : ModelFacultad
    {
        [Column("intIdCarrera")] public int intIdCarrera { set; get; } = 0;
        [Column("vchNombreCarrera")] public string strNombreCarrera { set; get; } = string.Empty;
        [Column("vchCodigoCarrera")] public string strCodigoCarrera { set; get; } = string.Empty;
        [Column("bitActivoCarrera")] public bool blnActivoCarrera { set; get; } = true;
        [Column("vchFechaCreacionCarrera")] public string strFechaCreacionCarrera { set; get; } = string.Empty;
        [Column("vchFechaActualizacionCarrera")] public string strFechaActualizacionCarrera { set; get; } = string.Empty;
    }
}
