using AutoMapper;
using WebAPI.Prayaga.Util.Class;
using WebAPI.Prayaga.Commons.CapaActual;
using WebAPI.Prayaga.Models.Carrera;
using WebAPI.Prayaga.DTOs.Comunes;
using WebAPI.Prayaga.DTOs.Carrera;
using WebAPI.Prayaga.Interfaces.Repositories;
using WebAPI.Prayaga.Interfaces.Services;
using WebAPI.Prayaga.Services.Class;

namespace WebAPI.Prayaga.Services.Services
{
    public class CarreraService : ICarreraService
    {
        private readonly ICapaActualService l_CapaActualService;
        private readonly ICarreraRepository l_CarreraRepository;
        private readonly IFacultadRepository l_FacultadRepository;
        private readonly IMapper l_Mapper;

        public CarreraService(ICapaActualService pCapaActualDatosService, ICarreraRepository pCarreraRepository, IFacultadRepository pFacultadRepository, IMapper pMapper)
        {
            l_CapaActualService = pCapaActualDatosService;
            l_CarreraRepository = pCarreraRepository;
            l_FacultadRepository = pFacultadRepository;
            l_Mapper = pMapper;
            l_CapaActualService.pCapaActualAsignar((byte)clsEnums.ENCapaOrigenLogError.CapaServicio);
        }

        public async Task<DToResponse<int>> SVCarreraInsertar(string pstrCodigoFacultad, string pstrCodigoCarrera, string pstrNombreCarrera, CancellationToken pCancellationToken)
        {
            ModelCarrera objModelCarrera = new ModelCarrera();
            var objModelFacultad = await l_FacultadRepository.DFacultadObtener(pstrCodigoFacultad);

            int intResult = await l_CarreraRepository.DCarreraInsertar(objModelFacultad.intIdFacultad, pstrCodigoCarrera, pstrNombreCarrera);
            return await new clsRespuesta(l_CapaActualService, pCancellationToken).fDtoGenerarRptaOK<int>(intResult);
        }

        public async Task<DToResponse<DToCarrera>> SVCarreraObtener(string pstrCodigoCarrera, CancellationToken pCancellationToken)
        {
            var objDTo = l_Mapper.Map<DToCarrera>(await l_CarreraRepository.DCarreraObtener(pstrCodigoCarrera));
            return await new clsRespuesta(l_CapaActualService, pCancellationToken).fDtoGenerarRptaOK<DToCarrera>(objDTo);
        }

        public async Task<DToResponse<List<DToCarrera>>> SVCarreraListar(CancellationToken pCancellationToken)
        {
            var lstDTo = l_Mapper.Map<List<DToCarrera>>(await l_CarreraRepository.DCarreraListar());
            return await new clsRespuesta(l_CapaActualService, pCancellationToken).fDtoGenerarRptaOK<List<DToCarrera>>(lstDTo);
        }

        public async Task<DToResponse<bool>> SVCarreraDatosActualizar(string pstrCodigoCarrera, string pstrNombreCarrera, CancellationToken pCancellationToken)
        {
            bool blnResult = await l_CarreraRepository.DCarreraDatosActualizar(pstrCodigoCarrera, pstrNombreCarrera);
            return await new clsRespuesta(l_CapaActualService, pCancellationToken).fDtoGenerarRptaOK<bool>(blnResult);
        }

        public async Task<DToResponse<bool>> SVCarreraEliminadaActualizar(string pstrCodigoCarrera, CancellationToken pCancellationToken)
        {
            bool blnResult = await l_CarreraRepository.DCarreraEliminadaActualizar(pstrCodigoCarrera);
            return await new clsRespuesta(l_CapaActualService, pCancellationToken).fDtoGenerarRptaOK<bool>(blnResult);
        }

        public async Task<DToResponse<bool>> SVCarreraEliminar(string pstrCodigoCarrera, CancellationToken pCancellationToken)
        {
            bool blnResult = await l_CarreraRepository.DCarreraEliminar(pstrCodigoCarrera);
            return await new clsRespuesta(l_CapaActualService, pCancellationToken).fDtoGenerarRptaOK<bool>(blnResult);
        }
    }
}
