<?php

namespace App\Http\Controllers;

use App\Models\Empresa;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Repositories\EmpresaRepository;
use Illuminate\Support\Facades\DB;

class EmpresaController extends Controller
{

    private $repository;

    public function __construct(EmpresaRepository $repository){
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
    public function departamentos($id)
    {
        //
        return response()->json(Empresa::with('departamento')->find($id));
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
        return $this->repository->find($id);
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
    public function colaborador($id)
    {
        //
     $result_tipo['tipo'] = DB::table('tipo_avaliadores')->get();


        $result['result'] = DB::table('dados_users')
            ->join('departamento_cargos', 'dados_users.departamento_cargos_id', '=', 'departamento_cargos.id')
            ->join('departamentos', 'departamentos.id', '=', 'departamento_cargos.departamento_id')
            ->join('cargos', 'cargos.id', '=', 'departamento_cargos.cargo_id')
            ->join('users', 'users.id', '=', 'dados_users.user_id')
            ->select(
                'users.id',
                'users.name',
                'cargos.nome as cargos',
                'departamentos.nome as departamento',
                DB::raw('(SELECT COUNT(avalicao_users.id) FROM avalicao_users WHERE avalicao_users.avalidado_id = users.id) as totalAvaliadores')
            )  ->where('dados_users.empresa_id', '=', $id)
            ->orderBy('users.name', 'asc')
            ->get();

        if(count($result) > 0){
            return response()->json(['error'=> false, 'dados'=> array_merge($result_tipo,$result) ]);
        }else{
            return response()->json(['error'=> true, 'dados'=> '']);
        }

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
        return response()->json($this->repository->update($request->all(),$id));
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
