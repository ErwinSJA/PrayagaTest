using System.Net;

namespace WebAPI.Prayaga.Commons.Exceptions
{
    public class ExceptionInternalServer : CustomException
    {
        public ExceptionInternalServer(string pstrMensaje, string pstrHeaderResponse = "", string? error = default)
            : base(pstrMensaje, pstrHeaderResponse, error, HttpStatusCode.InternalServerError) { }
    }
}
