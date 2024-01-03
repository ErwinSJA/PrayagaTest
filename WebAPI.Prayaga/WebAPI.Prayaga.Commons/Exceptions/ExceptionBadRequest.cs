﻿using System.Net;

namespace WebAPI.Prayaga.Commons.Exceptions
{
    public class ExceptionBadRequest : CustomException
    {
        public ExceptionBadRequest(string message, string pstrHeaderResponse = "") 
            : base(message, pstrHeaderResponse, null, HttpStatusCode.BadRequest) { }
    }
}
