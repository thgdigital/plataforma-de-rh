<?php

namespace App\Http\Controllers;

use App\Models\Cargo;
use App\Repositories\CargoRepository;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class CargoController extends Controller
{
    private  $repository;
    public function  __construct(CargoRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        return response()->json(Cargo::with('departamento')->find($id));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $result = DB::table('departamento_cargos')
            ->join('departamentos', 'departamentos.id', '=', 'departamento_cargos.departamento_id')
            ->join('cargos', 'cargos.id', '=', 'departamento_cargos.cargo_id')
            ->select(
                'departamento_cargos.id',
                'cargos.id as cargoId',
                'cargos.nome',
                'cargos.descricao',
                'cargos.created_at'

            )  ->where('departamento_cargos.id', '=', $id)
            ->get();
        return $result;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //

        if($this->repository->update($request->all(), $request->input('cargoId'))){

            return response()->json(['error'=> false, 'message'=> 'dados cadastrado com sucesso' ]);
        }else{
            return response()->json(['error'=> true, 'message'=> 'Erro ao cadastrar']);
        }
    }
    public function salve(Request $request, $id)
    {
        $cargo = new \App\Models\Cargo($request->all());
        $cargos = $cargo->save();
        $departamento = \App\Models\Departamento::find($id);

       $query = DB::table('departamento_cargos')->insert(['departamento_id' => $departamento->id, 'cargo_id' => $cargo->id, 'created_at'=> date('Y-m-i H:i:s'), 'updated_at'=> date('Y-m-i H:i:s')]);

        if($query){
            return response()->json(['error'=> false, 'message'=> 'dados cadastrado com sucesso' ]);
        }else{
            return response()->json(['error'=> true, 'message'=> 'Erro ao cadastrar']);
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    public function colaborador($id){

        $result['dado_user'] = DB::table('dados_users')
            ->join('departamento_cargos', 'dados_users.departamento_cargos_id', '=', 'departamento_cargos.id')
            ->join('departamentos', 'departamentos.id', '=', 'departamento_cargos.departamento_id')
            ->join('cargos', 'cargos.id', '=', 'departamento_cargos.cargo_id')
            ->join('users', 'users.id', '=', 'dados_users.user_id')
            ->select(
                'users.id',
                'users.name',
                'users.email',
                'users.created_at'
            )  ->where('departamento_cargos.id', '=', $id)
            ->get();
         $result['cargo'] = DB::table('departamento_cargos')
             ->join('cargos', 'cargos.id', '=', 'departamento_cargos.cargo_id')
             ->select('cargos.*',
                'departamento_cargos.id as idDepartamentoCargo' )
             ->where('departamento_cargos.id', '=', $id)
             ->get();
        return $result;
    }
}
