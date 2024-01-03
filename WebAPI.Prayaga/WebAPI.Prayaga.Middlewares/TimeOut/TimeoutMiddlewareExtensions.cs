﻿using Microsoft.AspNetCore.Builder;

namespace WebAPI.Prayaga.Middlewares.TimeOut
{
    public static class TimeoutMiddlewareExtensions
    {
        public static IApplicationBuilder UseTimeoutMiddleware(this IApplicationBuilder builder, int timeout)
        {
            return builder.UseMiddleware<TimeoutMiddleware>(timeout);
        }
    }
}
