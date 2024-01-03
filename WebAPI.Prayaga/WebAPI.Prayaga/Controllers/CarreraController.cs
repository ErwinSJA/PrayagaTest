using Microsoft.AspNetCore.JsonPatch;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;
using WebAPI.Prayaga.Util.Class;
using WebAPI.Prayaga.Commons.CapaActual;
using WebAPI.Prayaga.DTOs.Carrera;
using WebAPI.Prayaga.DTOs.Comunes;
using WebAPI.Prayaga.DTOs.Facultad;
using WebAPI.Prayaga.Interfaces.Services;

namespace WebAPI.Prayaga.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [SwaggerTag("API que expone métodos REST de Carrera.")]
    [ProducesResponseType(StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    [ProducesResponseType(StatusCodes.Status408RequestTimeout)]
    [ProducesResponseType(StatusCodes.Status500InternalServerError)]
    [Produces("application/json")]
    [SwaggerResponse(StatusCodes.Status400BadRequest, "Indica obtención no válida.", typeof(DToResponse<string>))]
    [SwaggerResponse(StatusCodes.Status401Unauthorized, "No autorizado.", typeof(DToResponse<string>))]
    [SwaggerResponse(StatusCodes.Status408RequestTimeout, "Excedió el Tiempo de espera.", typeof(DToResponse<string>))]
    [SwaggerResponse(StatusCodes.Status500InternalServerError, "Error general", typeof(DToResponse<string>))]

    public class CarreraController : Controller
    {
        private readonly ICapaActualService l_CapaActualService;
        private readonly ICarreraService l_CarreraService;

        public CarreraController(ICapaActualService pCapaActualService, ICarreraService pCarreraService)
        {
            l_CapaActualService = pCapaActualService;
            l_CarreraService = pCarreraService;
            l_CapaActualService.pCapaActualAsignar((byte)clsEnums.ENCapaOrigenLogError.CapaControlador);
        }

        [HttpPost]
        [Route("CarreraInsertar")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [SwaggerOperation(
        Summary = "Carrera Insertar",
            Description = "Registra una nueva Carrera.",
            OperationId = "CarreraInsertar",
            Tags = new[] { "Carrera" })]
        [SwaggerResponse(StatusCodes.Status200OK, "Inserción correcta de datos.", typeof(DToResponse<int>))]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Inserción no válida.", typeof(DToResponse<int>))]
        public async Task<DToResponse<int>> CarreraInsertar([FromQuery] string pstrCodigoFacultad, [FromQuery] string pstrCodigoCarrera, [FromQuery] string pstrNombreCarrera, CancellationToken pCancellationToken)
        {
            return await l_CarreraService.SVCarreraInsertar(pstrCodigoFacultad, pstrCodigoCarrera, pstrNombreCarrera, pCancellationToken);
        }

        [HttpGet]
        [Route("CarreraObtener")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [SwaggerOperation(
        Summary = "Carrera Obtener",
            Description = "Obtiene los datos de un Carrera.",
            OperationId = "CarreraObtener",
            Tags = new[] { "Carrera" })]
        [SwaggerResponse(StatusCodes.Status200OK, "Obtención correcta de datos.", typeof(DToResponse<DToCarrera>))]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Obtención no válida.", typeof(DToResponse<DToCarrera>))]
        public async Task<DToResponse<DToCarrera>> CarreraObtener([FromQuery] string pstrCodigoCarrera, CancellationToken pCancellationToken)
        {
            return await l_CarreraService.SVCarreraObtener(pstrCodigoCarrera, pCancellationToken);
        }

        [HttpGet]
        [Route("CarreraListar")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [SwaggerOperation(
        Summary = "Carrera Listar",
            Description = "Lista los datos de todas las Carreras.",
            OperationId = "CarreraListar",
            Tags = new[] { "Carrera" })]
        [SwaggerResponse(StatusCodes.Status201Created, "Listado correcto de datos.", typeof(DToResponse<List<DToCarrera>>))]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Listado no válido.", typeof(DToResponse<List<DToCarrera>>))]
        public async Task<DToResponse<List<DToCarrera>>> CarreraListar(CancellationToken pCancellationToken)
        {
            return await l_CarreraService.SVCarreraListar(pCancellationToken);
        }

        [HttpPut]
        [Route("CarreraDatosActualizar")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [SwaggerOperation(
        Summary = "Carrera Datos Actualizar",
            Description = "Modifica el nombre de la carrera.",
            OperationId = "CarreraDatosActualizar",
            Tags = new[] { "Carrera" })]
        [SwaggerResponse(StatusCodes.Status200OK, "Modificacion correcta de datos.", typeof(DToResponse<bool>))]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Modificacion no válida.", typeof(DToResponse<bool>))]
        public async Task<DToResponse<bool>> CarreraDatosActualizar([FromQuery] string pstrCodigoCarrera, [FromQuery] string pstrNombreCarrera, CancellationToken pCancellationToken)
        {
            return await l_CarreraService.SVCarreraDatosActualizar(pstrCodigoCarrera, pstrNombreCarrera, pCancellationToken);
        }

        [HttpPut]
        [Route("CarreraEliminadaActualizar")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [SwaggerOperation(
        Summary = "Carrera Eliminada Actualizar",
            Description = "Retorna a válido el estado de una Carrera.",
            OperationId = "CarreraEliminadaActualizar",
            Tags = new[] { "Carrera" })]
        [SwaggerResponse(StatusCodes.Status200OK, "Modificación correcta de estado.", typeof(DToResponse<bool>))]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Modificación no válida.", typeof(DToResponse<bool>))]
        public async Task<DToResponse<bool>> CarreraEliminadaActualizar([FromQuery] string pstrCodigoCarrera, CancellationToken pCancellationToken)
        {
            return await l_CarreraService.SVCarreraEliminadaActualizar(pstrCodigoCarrera, pCancellationToken);
        }

        [HttpPut]
        [Route("CarreraEliminar")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [SwaggerOperation(
        Summary = "Carrera Eliminar",
            Description = "Elimina (Inhabilita) una Carrera.",
            OperationId = "CarreraEliminar",
            Tags = new[] { "Carrera" })]
        [SwaggerResponse(StatusCodes.Status200OK, "Modificación correcta de estado.", typeof(DToResponse<bool>))]
        [SwaggerResponse(StatusCodes.Status400BadRequest, "Modificación no válida.", typeof(DToResponse<bool>))]
        public async Task<DToResponse<bool>> CarreraEliminar([FromQuery] string pstrCodigoCarrera, CancellationToken pCancellationToken)
        {
            return await l_CarreraService.SVCarreraEliminar(pstrCodigoCarrera, pCancellationToken);
        }
    }
}
