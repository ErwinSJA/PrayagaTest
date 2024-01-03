using Dapper;
using System.Data;
using WebAPI.Prayaga.Util.Class;
using WebAPI.Prayaga.Commons.CapaActual;
using WebAPI.Prayaga.Commons.DapperHelper;
using WebAPI.Prayaga.Commons.SPCatalog;
using WebAPI.Prayaga.Models.Carrera;
using WebAPI.Prayaga.Interfaces.Repositories;
using static WebAPI.Prayaga.Util.Class.clsConstantes;

namespace WebAPI.Prayaga.Repositories.Repositories
{
    public class CarreraRepository : ICarreraRepository
    {
        private readonly IDapperHelper l_Helper;
        private readonly ICapaActualService l_CapaActualDatosService;

        public CarreraRepository(IDapperHelper pHelper, ICapaActualService pCapaActualDatosService)
        {
            l_Helper = pHelper;
            l_CapaActualDatosService = pCapaActualDatosService;
            l_CapaActualDatosService.pCapaActualAsignar((byte)clsEnums.ENCapaOrigenLogError.CapaRepositorio);
        }

        public async Task<int> DCarreraInsertar(int pintIdFacultad, string pstrCodigoCarrera, string pstrNombreCarrera)
        {
            DynamicParameters dpParametros = new();
            dpParametros.Add("@peintIdFacultad", pintIdFacultad, DbType.Int32, ParameterDirection.Input);
            dpParametros.Add("@pevchCodigoCarrera", pstrCodigoCarrera, DbType.String, ParameterDirection.Input);
            dpParametros.Add("@pevchNombreCarrera", pstrNombreCarrera, DbType.String, ParameterDirection.Input);

            l_Helper.l_strBD = STDB.G_STRDBFacultad;
            return await l_Helper.ExecuteSP_Single<int>(clsUspCarrera.CarreraInsertar, dpParametros);
        }

        public async Task<ModelCarrera> DCarreraObtener(string pstrCodigoCarrera)
        {
            DynamicParameters dpParametros = new();
            dpParametros.Add("@pevchCodigo", pstrCodigoCarrera, DbType.String, ParameterDirection.Input);

            l_Helper.l_strBD = STDB.G_STRDBFacultad;
            return await l_Helper.ExecuteSP_Single<ModelCarrera> (clsUspCarrera.CarreraObtener, dpParametros, true);
        }

        public async Task<List<ModelCarrera>> DCarreraListar()
        {
            l_Helper.l_strBD = STDB.G_STRDBFacultad;
            return await l_Helper.ExecuteSP_Multiple<ModelCarrera>(clsUspCarrera.CarreraListar, new {}, true);
        }

        public async Task<bool> DCarreraDatosActualizar(string pstrCodigoCarrera, string pstrNombreCarrera)
        {
            DynamicParameters dpParametros = new();
            dpParametros.Add("@pevchCodigo", pstrCodigoCarrera, DbType.String, ParameterDirection.Input);
            dpParametros.Add("@pevchNombre", pstrNombreCarrera, DbType.String, ParameterDirection.Input);

            l_Helper.l_strBD = STDB.G_STRDBFacultad;
            await l_Helper.ExecuteSPonly(clsUspCarrera.CarreraDatosActualizar, dpParametros);

            return true;
        }

        public async Task<bool> DCarreraEliminadaActualizar(string pstrCodigoCarrera)
        {
            DynamicParameters dpParametros = new();
            dpParametros.Add("@pevchCodigo", pstrCodigoCarrera, DbType.String, ParameterDirection.Input);

            l_Helper.l_strBD = STDB.G_STRDBFacultad;
            await l_Helper.ExecuteSPonly(clsUspCarrera.CarreraEliminadaActualizar, dpParametros);

            return true;
        }

        public async Task<bool> DCarreraEliminar(string pstrCodigoCarrera)
        {
            DynamicParameters dpParametros = new();
            dpParametros.Add("@pevchCodigo", pstrCodigoCarrera, DbType.String, ParameterDirection.Input);

            l_Helper.l_strBD = STDB.G_STRDBFacultad;
            await l_Helper.ExecuteSPonly(clsUspCarrera.CarreraEliminar, dpParametros);

            return true;
        }

    }
}