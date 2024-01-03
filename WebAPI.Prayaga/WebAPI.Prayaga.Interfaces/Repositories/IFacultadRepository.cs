using WebAPI.Prayaga.Models.Facultad;

namespace WebAPI.Prayaga.Interfaces.Repositories
{
    public interface IFacultadRepository
    {
        Task<int> DFacultadInsertar(string pstrCodigoFacultad, string pstrNombreFacultad);
        Task<ModelFacultad> DFacultadObtener(string pstrCodigoFacultad);
        Task<List<ModelFacultad>> DFacultadListar();
        Task<bool> DFacultadDatosActualizar(string pstrCodigoFacultad, string pstrNombreFacultad);
        Task<bool> DFacultadEliminadaActualizar(string pstrCodigoFacultad);
        Task<bool> DFacultadEliminar(string pstrCodigoFacultad, string pstrCodigoFacultadNuevo);
    }
}
