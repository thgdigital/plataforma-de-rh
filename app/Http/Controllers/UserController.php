<?php

namespace App\Http\Controllers;

use App\Models\Empresa;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Repositories\UserRepository;
use BD;
use App\User;
use Illuminate\Support\Facades\DB;
class UserController extends Controller
{
    private $repository;

    public function __construct(UserRepository $repository){
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
        return $this->repository->findAll();
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
    public function buscarDados($id){


         return response()->json(User::with('empresa')->find($id));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //

    }
    public function colaboradores($id){
        $avalido = DB::table('users')
            ->join('dados_users', 'users.id', '=', 'dados_users.user_id')
            ->join('departamento_cargos', 'departamento_cargos.id', '=', 'dados_users.departamento_cargos_id')
            ->join('departamentos', 'departamentos.id', '=', 'departamento_cargos.departamento_id')
            ->join('cargos', 'cargos.id', '=', 'departamento_cargos.cargo_id')

            ->select(
                'users.id',
                'users.name',
                'users.created_at',
                'cargos.nome as cargos',
                'departamentos.nome as departamento'

            )
            ->where('dados_users.empresa_id', $id)
            ->orderBy('users.id', 'ASC')
            ->paginate(15);
        return $avalido;
    }

    public  function avalidadores(Request $request, $empresa){

        $count = count($request->all());
        $ids=[];

        for($i=0; $i < $count; $i++){
            $ids[] = $request->input($i.'.id');
        }

        $avalido = DB::table('users')
            ->join('dados_users', 'users.id', '=', 'dados_users.user_id')
            ->join('departamento_cargos', 'departamento_cargos.id', '=', 'dados_users.departamento_cargos_id')
            ->join('departamentos', 'departamentos.id', '=', 'departamento_cargos.departamento_id')
            ->join('cargos', 'cargos.id', '=', 'departamento_cargos.cargo_id')

            ->select(
                'users.id',
                'users.name',
                'cargos.nome as cargos',
                'departamentos.nome as departamento',
                'dados_users.empresa_id as empresa'
            )
            ->whereNotIn('users.id', $ids)
            ->where('dados_users.empresa_id', $empresa)
            ->get();

        return $avalido;

    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
