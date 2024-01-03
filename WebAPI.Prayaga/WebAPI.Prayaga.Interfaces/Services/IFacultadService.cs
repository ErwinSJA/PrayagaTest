using Microsoft.AspNetCore.JsonPatch;
using WebAPI.Prayaga.DTOs.Comunes;
using WebAPI.Prayaga.DTOs.Facultad;

namespace WebAPI.Prayaga.Interfaces.Services
{
    public interface IFacultadService
    {
        Task<DToResponse<int>> SVFacultadInsertar(string pstrCodigoFacultad, string pstrNombreFacultad, CancellationToken pCancellationToken);
        Task<DToResponse<DToFacultad>> SVFacultadObtener(string pstrCodigoFacultad, CancellationToken pCancellationToken);
        Task<DToResponse<List<DToFacultad>>> SVFacultadListar(CancellationToken pCancellationToken);
        Task<DToResponse<bool>> SVFacultadDatosActualizar(string pstrCodigoFacultad, string pstrNombreFacultad, CancellationToken pCancellationToken);
        Task<DToResponse<bool>> SVFacultadEliminadaActualizar(string pstrCodigoFacultad, CancellationToken pCancellationToken);
        Task<DToResponse<bool>> SVFacultadEliminar(string pstrCodigoFacultad, string pstrCodigoFacultadNuevo, CancellationToken pCancellationToken);
    }
}
