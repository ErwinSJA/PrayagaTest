using Dapper;
using System.Data;
using WebAPI.Prayaga.Util.Class;
using WebAPI.Prayaga.Commons.CapaActual;
using WebAPI.Prayaga.Commons.DapperHelper;
using WebAPI.Prayaga.Commons.SPCatalog;
using WebAPI.Prayaga.Models.Facultad;
using WebAPI.Prayaga.Interfaces.Repositories;
using static WebAPI.Prayaga.Util.Class.clsConstantes;

namespace WebAPI.Prayaga.Repositories.Repositories
{
    public class FacultadRepository : IFacultadRepository
    {
        private readonly IDapperHelper l_Helper;
        private readonly ICapaActualService l_CapaActualDatosService;

        public FacultadRepository(IDapperHelper pHelper, ICapaActualService pCapaActualDatosService)
        {
            l_Helper = pHelper;
            l_CapaActualDatosService = pCapaActualDatosService;
            l_CapaActualDatosService.pCapaActualAsignar((byte)clsEnums.ENCapaOrigenLogError.CapaRepositorio);
        }

        public async Task<int> DFacultadInsertar(string pstrCodigoFacultad, string pstrNombreFacultad)
        {
            DynamicParameters dpParametros = new();

            dpParametros.Add("@pevchCodigo", pstrCodigoFacultad, DbType.String, ParameterDirection.Input);
            dpParametros.Add("@pevchNombre", pstrNombreFacultad, DbType.String, ParameterDirection.Input);

            l_Helper.l_strBD = STDB.G_STRDBFacultad;
            return await l_Helper.ExecuteSP_Single<int> (clsUspFacultad.FacultadInsertar, dpParametros);
        }

        public async Task<ModelFacultad> DFacultadObtener(string pstrCodigoFacultad)
        {
            DynamicParameters dpParametros = new();
            dpParametros.Add("@pevchCodigo", pstrCodigoFacultad, DbType.String, ParameterDirection.Input);

            l_Helper.l_strBD = STDB.G_STRDBFacultad;
            return await l_Helper.ExecuteSP_Single<ModelFacultad>(clsUspFacultad.FacultadObtener, dpParametros, true);
        }

        public async Task<List<ModelFacultad>> DFacultadListar()
        {
            l_Helper.l_strBD = STDB.G_STRDBFacultad;
            return await l_Helper.ExecuteSP_Multiple<ModelFacultad>(clsUspFacultad.FacultadListar, new { }, true);
        }

        public async Task<bool> DFacultadDatosActualizar(string pstrCodigoFacultad, string pstrNombreFacultad)
        {
            DynamicParameters dpParametros = new();
            dpParametros.Add("@pevchCodigo", pstrCodigoFacultad, DbType.String, ParameterDirection.Input);
            dpParametros.Add("@pevchNombre", pstrNombreFacultad, DbType.String, ParameterDirection.Input);

            l_Helper.l_strBD = STDB.G_STRDBFacultad;
            await l_Helper.ExecuteSPonly(clsUspFacultad.FacultadDatosActualizar, dpParametros);

            return true;
        }

        public async Task<bool> DFacultadEliminadaActualizar(string pstrCodigoFacultad)
        {
            DynamicParameters dpParametros = new();
            dpParametros.Add("@pevchCodigo", pstrCodigoFacultad, DbType.String, ParameterDirection.Input);

            l_Helper.l_strBD = STDB.G_STRDBFacultad;
            await l_Helper.ExecuteSPonly(clsUspFacultad.FacultadEliminadaActualizar, dpParametros);

            return true;
        }

        public async Task<bool> DFacultadEliminar(string pstrCodigoFacultad, string pstrCodigoFacultadNuevo)
        {
            DynamicParameters dpParametros = new();
            dpParametros.Add("@pevchCodigoFacultad", pstrCodigoFacultad, DbType.String, ParameterDirection.Input);
            dpParametros.Add("@pevchCodigoFacultadNueva", pstrCodigoFacultadNuevo, DbType.String, ParameterDirection.Input);

            l_Helper.l_strBD = STDB.G_STRDBFacultad;
            await l_Helper.ExecuteSPonly(clsUspFacultad.FacultadEliminar, dpParametros);

            return true;
        }
    }
}