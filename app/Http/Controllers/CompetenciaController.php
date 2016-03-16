<?php

namespace App\Http\Controllers;

use App\Models\Competencia;
use App\Models\CompetenciaTipo;
use App\Models\Comportamento;
use App\Repositories\ComportamentoRepository;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class CompetenciaController extends Controller
{
    private $comportamentoRepository;
    private $repository;

    public function __construct(ComportamentoRepository $comportamentoRepository, ComportamentoRepository $repository)
    {
        $this->comportamentoRepository = $comportamentoRepository;
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
    public function store(Request $request, $id)
    {
        //
        $competencia = new Competencia(['nome' => $request->input('nome'), 'descricao' => $request->input('descricao'), 'empresa_id' => $id]);
        $dados = $competencia->save();
        $where = ['empresa_id' => $id];
        $comp = DB::table("competencias")->where($where)->orderBy('competencias.created_at', 'DESC')->first();
        if (count($dados) > 0) {
            $tipo = new CompetenciaTipo(['competencia_id' => $comp->id, 'tipo_id' => $request->input('tipo')]);
            $tip = $tipo->save();
            $comportamento = DB::table("competencias")
                ->join('competencia_tipos', 'competencias.id', '=', 'competencia_tipos.competencia_id')
                ->join('tipo_competencias', 'tipo_competencias.id', '=', 'competencia_tipos.tipo_id')
                ->select(
                    "competencia_tipos.id",
                    "competencias.id as IdCompetencia",
                    "competencias.nome",
                    "competencias.created_at",
                    "competencias.descricao",
                    "tipo_competencias.nome as tipo",
                    "competencias.created_at"
                )
                ->where(['competencia_id' => $comp->id, 'tipo_id' => $request->input('tipo')])->orderBy('competencias.created_at', 'DESC')->first();

            return response()->json($comportamento);
        } else {
            return [];
        }
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
        $where = ['empresa_id' => $id];
        $comportamento = DB::table("competencias")
            ->join('competencia_tipos', 'competencias.id', '=', 'competencia_tipos.competencia_id')
            ->join('tipo_competencias', 'tipo_competencias.id', '=', 'competencia_tipos.tipo_id')
            ->select(
                "competencia_tipos.id",
                "competencias.id as IdCompetencia",
                "competencias.nome",
                "competencias.created_at",
                "competencias.descricao",
                "tipo_competencias.nome as tipo",
                "competencias.created_at"
            )
            ->where($where)->orderBy('competencias.created_at', 'DESC')->paginate(8);

        return $comportamento;


    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $where = ['competencia_tipos.id' => $id];

        $comportamento = DB::table("competencias")
            ->join('competencia_tipos', 'competencias.id', '=', 'competencia_tipos.competencia_id')
            ->join('tipo_competencias', 'tipo_competencias.id', '=', 'competencia_tipos.tipo_id')
            ->select(
                "competencia_tipos.id",
                "competencias.nome",
                "competencias.id as IdCompetencia",
                "competencias.created_at",
                "competencias.descricao",
                "tipo_competencias.id as tipo",
                "competencias.created_at"
            )
            ->where($where)->orderBy('competencias.created_at', 'DESC')->first();

        return response()->json($comportamento);
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
        $whereCompetencia = ['id' => $request->input('IdCompetencia'), 'empresa_id' => $id];

        $table = DB::table('competencias')
            ->where($whereCompetencia)
            ->update([
                'nome' => $request->input('nome'),
                'descricao' => $request->input('descricao'),
                'updated_at' => date('Y-m-d H:i:s')

            ]);
        if ($table) {
            $where = ['id' => $request->input('id')];
            $result = DB::table('competencia_tipos')
                ->where($where)
                ->update(['tipo_id' => $request->input('tipo'), 'updated_at' => date('Y-m-d H:i:s')]);
            if ($result) {
                return ['error' => false, 'mesagem' => 'Dados alterado com sucesso'];
            } else {
                return ['error' => true, 'mesagem' => 'Error ao alterar dados'];
            }
        } else {
            return ['error' => true, 'mesagem' => 'Error ao alterar dados'];
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

    public function tipo()
    {
        $tipo = DB::table("tipo_competencias")->select("tipo_competencias.*")->get();

        return $tipo;

    }

    public function saveComportamanto(Request $request, $id)
    {

        $competencia = \App\Models\Competencia::find($id);
        $comportamento = new Comportamento(['nome' => $request->input('nome'), 'descricao' => $request->input('descricao')]);
        $result = $competencia->comportamentos()->save($comportamento);

        return response()->json($result);

    }

    public function comportamento($id)
    {

        return response()->json(Competencia::with('comportamentos')->find($id));
    }

    public function byComportamanto($id)
    {

        return Comportamento::find($id);
    }

    public function updateComportamanto(Request $request, $id)
    {

        return response()->json($this->comportamentoRepository->update($request->all(),$id));
    }
    public  function notCompetencia($id){
        $competencia = DB::table('competencias')->where('id', '!=', $id)->get();
        return $competencia;
    }
}
