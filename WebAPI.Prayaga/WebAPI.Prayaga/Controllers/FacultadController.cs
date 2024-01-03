using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;
using WebAPI.Prayaga.Util.Class;
using WebAPI.Prayaga.Commons.CapaActual;
using WebAPI.Prayaga.DTOs.Comunes;
using WebAPI.Prayaga.DTOs.Facultad;
using WebAPI.Prayaga.Interfaces.Services;

namespace WebAPI.Prayaga.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [SwaggerTag("API que expone métodos REST de Facultad.")]
    [ProducesResponseType(StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    [ProducesResponseType(StatusCodes.Status408RequestTimeout)]
    [ProducesResponseType(StatusCodes.Status500InternalServerError)]
    [Produces("application/json")]
    [SwaggerResponse(StatusCodes.Status400BadRequest, "Indica obtención no válida.", typeof(DToResponse<string>))]
    [SwaggerResponse(StatusCodes.Status401Unauthorized, "No autorizado.", typeof(DToResponse<string>))]
    [SwaggerResponse(StatusCodes.Status408RequestTimeout, "Excedió el Tiempo de espera.", typeof(DToResponse<string>))]
    [SwaggerResponse(StatusCodes.Status500InternalServerError, "Error general", typeof(DToResponse<string>))]

    public class FacultadController : Controller
    {
        private readonly ICapaActualService l_CapaActualService;
        private readonly IFacultadService l_FacultadService;

        public FacultadController(ICapaActualService pCapaActualService, IFacultadService pFacultadService)
        {
            l_CapaActualService = pCapaActualService;
            l_FacultadService = pFacultadService;
            l_CapaActualService.pCapaActualAsignar((byte)clsEnums.ENCapaOrigenLogError.CapaControlador);
        }

        [HttpPost]
        [Route("FacultadInsertar")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [SwaggerOperation(
        Summary = "Facultad Insertar",
            Description = "Registra una nueva Facultad.",
            OperationId = "FacultadInsertar",
            Tags = new[] { "Facultad" })]
        [SwaggerResponse(StatusCodes.Status200OK, "Inserción correcta de datos.", typeof(DToResponse<int>))]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Inserción no válida.", typeof(DToResponse<int>))]
        public async Task<DToResponse<int>> FacultadInsertar([FromQuery] string pstrCodigoFacultad, [FromQuery] string pstrNombreFacultad, CancellationToken pCancellationToken)
        {
            return await l_FacultadService.SVFacultadInsertar(pstrCodigoFacultad, pstrNombreFacultad, pCancellationToken);
        }

        [HttpGet]
        [Route("FacultadObtener")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [SwaggerOperation(
        Summary = "Facultad Obtener",
            Description = "Obtiene los datos de un Facultad.",
            OperationId = "FacultadObtener",
            Tags = new[] { "Facultad" })]
        [SwaggerResponse(StatusCodes.Status200OK, "Obtención correcta de datos.", typeof(DToResponse<DToFacultad>))]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Obtención no válida.", typeof(DToResponse<DToFacultad>))]
        public async Task<DToResponse<DToFacultad>> FacultadObtener([FromQuery] string pstrCodigoFacultad, CancellationToken pCancellationToken)
        {
            return await l_FacultadService.SVFacultadObtener(pstrCodigoFacultad, pCancellationToken);
        }

        [HttpGet]
        [Route("FacultadListar")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [SwaggerOperation(
        Summary = "Facultad Listar",
            Description = "Lista los datos de todas las Facultades.",
            OperationId = "FacultadListar",
            Tags = new[] { "Facultad" })]
        [SwaggerResponse(StatusCodes.Status201Created, "Listado correcto de datos.", typeof(DToResponse<List<DToFacultad>>))]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Listado no válido.", typeof(DToResponse<List<DToFacultad>>))]
        public async Task<DToResponse<List<DToFacultad>>> FacultadListar(CancellationToken pCancellationToken)
        {
            return await l_FacultadService.SVFacultadListar(pCancellationToken);
        }

        [HttpPut]
        [Route("FacultadDatosActualizar")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [SwaggerOperation(
        Summary = "Facultad Datos Actualizar",
            Description = "Modifica el nombre de la Facultad.",
            OperationId = "FacultadDatosActualizar",
            Tags = new[] { "Facultad" })]
        [SwaggerResponse(StatusCodes.Status200OK, "Modificacion correcta de datos.", typeof(DToResponse<bool>))]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Modificacion no válida.", typeof(DToResponse<bool>))]
        public async Task<DToResponse<bool>> FacultadDatosActualizar([FromQuery] string pstrCodigoFacultad, [FromQuery] string pstrNombreFacultad, CancellationToken pCancellationToken)
        {
            return await l_FacultadService.SVFacultadDatosActualizar(pstrCodigoFacultad, pstrNombreFacultad, pCancellationToken);
        }

        [HttpPut]
        [Route("FacultadEliminadaActualizar")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [SwaggerOperation(
        Summary = "Facultad Eliminada Actualizar",
            Description = "Retorna a válido el estado de una Facultad.",
            OperationId = "FacultadEliminadaActualizar",
            Tags = new[] { "Facultad" })]
        [SwaggerResponse(StatusCodes.Status200OK, "Modificación correcta de estado.", typeof(DToResponse<bool>))]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Modificación no válida.", typeof(DToResponse<bool>))]
        public async Task<DToResponse<bool>> FacultadEliminadaActualizar([FromQuery] string pstrCodigoFacultad, CancellationToken pCancellationToken)
        {
            return await l_FacultadService.SVFacultadEliminadaActualizar(pstrCodigoFacultad, pCancellationToken);
        }

        [HttpPut]
        [Route("FacultadEliminar")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [SwaggerOperation(
        Summary = "Facultad Eliminar",
            Description = "Elimina (Inhabilita) una Facultad. Llenar con 0 en caso no se desee migrar las carreras a una nueva Facultad",
            OperationId = "FacultadEliminar",
            Tags = new[] { "Facultad" })]
        [SwaggerResponse(StatusCodes.Status200OK, "Modificación correcta de estado.", typeof(DToResponse<bool>))]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Modificación no válida.", typeof(DToResponse<bool>))]
        public async Task<DToResponse<bool>> FacultadEliminar([FromQuery] string pstrCodigoFacultad, [FromQuery] string pstrCodigoFacultadNuevo, CancellationToken pCancellationToken)
        {
            return await l_FacultadService.SVFacultadEliminar(pstrCodigoFacultad, pstrCodigoFacultadNuevo == "0" ? "" : pstrCodigoFacultadNuevo, pCancellationToken);
        }
    }
}
