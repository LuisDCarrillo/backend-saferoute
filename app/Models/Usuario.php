<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{
    use HasFactory;

    // Especificamos la tabla
    protected $table = 'usuario';

    // Especificamos los campos que son asignables
    protected $fillable = ['nombre', 'apellido', 'telefono', 'correo', 'fecha_nacimiento', 'status'];

    
}
