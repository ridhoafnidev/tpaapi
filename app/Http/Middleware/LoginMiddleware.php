<?php
namespace App\Http\Middleware;

use Closure;
use App\Models\Ortu;

class LoginMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if ($request->input('token')) {
            $check =  Ortu::where('token', $request->input('token'))->first();

            if (!$check) {
                return response('Token Tidak Valid.', 401);
            } else {
                return $next($request);
            }
        } else {
            return response('Silahkan Masukkan Token.', 401);
        }
    }
}