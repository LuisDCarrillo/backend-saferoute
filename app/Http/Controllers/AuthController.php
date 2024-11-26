<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Usuario;  // Usamos el modelo Usuario
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    // Registro
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nombre' => 'required|string|max:255',
            'apellido' => 'required|string|max:255',
            'telefono' => 'required|string|max:20',
            'correo' => 'required|email|unique:usuario,correo',
            'fecha_nacimiento' => 'required|date',
            'status' => 'boolean',
            'password' => 'required|string|min:8|confirmed',  // Incluyendo la validación de password
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $usuario = Usuario::create([
            'nombre' => $request->nombre,
            'apellido' => $request->apellido,
            'telefono' => $request->telefono,
            'correo' => $request->correo,
            'fecha_nacimiento' => $request->fecha_nacimiento,
            'status' => $request->status ?? true,  // Si no se proporciona el status, se considera true por defecto
            'password' => Hash::make($request->password),  // Hashear la contraseña
        ]);

        // Login automático después del registro
        Auth::login($usuario);

        return response()->json(['message' => 'Registro exitoso', 'usuario' => $usuario]);
    }

    // Login
    public function login(Request $request)
    {
        $credentials = $request->only('correo', 'password');

        if (Auth::attempt($credentials)) {
            $usuario = Auth::user();
            return response()->json(['message' => 'Login exitoso', 'usuario' => $usuario]);
        }

        return response()->json(['message' => 'Credenciales incorrectas'], 401);
    }

    // Logout
    public function logout()
    {
        Auth::logout();
        return response()->json(['message' => 'Logout exitoso']);
    }
}
