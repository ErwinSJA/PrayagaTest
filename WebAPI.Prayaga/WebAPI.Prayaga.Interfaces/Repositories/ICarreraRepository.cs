using WebAPI.Prayaga.Models.Carrera;

namespace WebAPI.Prayaga.Interfaces.Repositories
{
    public interface ICarreraRepository
    {
        Task<int> DCarreraInsertar(int pintIdFacultad, string pstrCodigoCarrera, string pstrNombreCarrera);
        Task<ModelCarrera> DCarreraObtener(string pstrCodigoCarrera);
        Task<List<ModelCarrera>> DCarreraListar();
        Task<bool> DCarreraDatosActualizar(string pstrCodigoCarrera, string pstrNombreCarrera);
        Task<bool> DCarreraEliminadaActualizar(string pstrCodigoCarrera);
        Task<bool> DCarreraEliminar(string pstrCodigoCarrera);



    }
}
