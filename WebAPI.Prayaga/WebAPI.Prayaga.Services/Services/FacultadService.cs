using AutoMapper;
using WebAPI.Prayaga.Util.Class;
using WebAPI.Prayaga.Commons.CapaActual;
using WebAPI.Prayaga.DTOs.Comunes;
using WebAPI.Prayaga.DTOs.Facultad;
using WebAPI.Prayaga.Interfaces.Repositories;
using WebAPI.Prayaga.Interfaces.Services;
using WebAPI.Prayaga.Services.Class;

namespace WebAPI.Prayaga.Services.Services
{
    public class FacultadService : IFacultadService
    {
        private readonly ICapaActualService l_CapaActualService;
        private readonly IFacultadRepository l_FacultadRepository;
        private readonly IMapper l_Mapper;

        public FacultadService(ICapaActualService pCapaActualDatosService, IFacultadRepository pFacultadRepository, IMapper pMapper)
        {
            l_CapaActualService = pCapaActualDatosService;
            l_FacultadRepository = pFacultadRepository;
            l_Mapper = pMapper;
            l_CapaActualService.pCapaActualAsignar((byte)clsEnums.ENCapaOrigenLogError.CapaServicio);
        }

        public async Task<DToResponse<int>> SVFacultadInsertar(string pstrCodigoFacultad, string pstrNombreFacultad, CancellationToken pCancellationToken)
        {
            int intResult = await l_FacultadRepository.DFacultadInsertar(pstrCodigoFacultad, pstrNombreFacultad);
            return await new clsRespuesta(l_CapaActualService, pCancellationToken).fDtoGenerarRptaOK<int>(intResult);
        }

        public async Task<DToResponse<DToFacultad>> SVFacultadObtener(string pstrCodigoFacultad, CancellationToken pCancellationToken)
        {
            var objDTo = l_Mapper.Map<DToFacultad>(await l_FacultadRepository.DFacultadObtener(pstrCodigoFacultad));
            return await new clsRespuesta(l_CapaActualService, pCancellationToken).fDtoGenerarRptaOK<DToFacultad>(objDTo);
        }

        public async Task<DToResponse<List<DToFacultad>>> SVFacultadListar(CancellationToken pCancellationToken)
        {
            var lstDTo = l_Mapper.Map<List<DToFacultad>>(await l_FacultadRepository.DFacultadListar());
            return await new clsRespuesta(l_CapaActualService, pCancellationToken).fDtoGenerarRptaOK<List<DToFacultad>>(lstDTo);
        }

        public async Task<DToResponse<bool>> SVFacultadDatosActualizar(string pstrCodigoFacultad, string pstrNombreFacultad, CancellationToken pCancellationToken)
        {
            bool blnResult = await l_FacultadRepository.DFacultadDatosActualizar(pstrCodigoFacultad, pstrNombreFacultad);
            return await new clsRespuesta(l_CapaActualService, pCancellationToken).fDtoGenerarRptaOK<bool>(blnResult);
        }

        public async Task<DToResponse<bool>> SVFacultadEliminadaActualizar(string pstrCodigoFacultad, CancellationToken pCancellationToken)
        {
            bool blnResult = await l_FacultadRepository.DFacultadEliminadaActualizar(pstrCodigoFacultad);
            return await new clsRespuesta(l_CapaActualService, pCancellationToken).fDtoGenerarRptaOK<bool>(blnResult);
        }

        public async Task<DToResponse<bool>> SVFacultadEliminar(string pstrCodigoFacultad, string pstrCodigoFacultadNuevo, CancellationToken pCancellationToken)
        {
            bool blnResult = await l_FacultadRepository.DFacultadEliminar(pstrCodigoFacultad, pstrCodigoFacultadNuevo);
            return await new clsRespuesta(l_CapaActualService, pCancellationToken).fDtoGenerarRptaOK<bool>(blnResult);
        }
    }
}
