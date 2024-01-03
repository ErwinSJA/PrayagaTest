using WebAPI.Prayaga.DTOs.Carrera;
using WebAPI.Prayaga.DTOs.Comunes;

namespace WebAPI.Prayaga.Interfaces.Services
{
    public interface ICarreraService
    {
        Task<DToResponse<int>> SVCarreraInsertar(string pstrCodigoFacultad, string pstrCodigoCarrera, string pstrNombreCarrera, CancellationToken pCancellationToken);
        Task<DToResponse<DToCarrera>> SVCarreraObtener(string pstrCodigoCarrera, CancellationToken pCancellationToken);
        Task<DToResponse<List<DToCarrera>>> SVCarreraListar(CancellationToken pCancellationToken);
        Task<DToResponse<bool>> SVCarreraDatosActualizar(string pstrCodigoCarrera, string pstrNombreCarrera, CancellationToken pCancellationToken);
        Task<DToResponse<bool>> SVCarreraEliminadaActualizar(string pstrCodigoCarrera, CancellationToken pCancellationToken);
        Task<DToResponse<bool>> SVCarreraEliminar(string pstrCodigoCarrera, CancellationToken pCancellationToken);
    }
}
