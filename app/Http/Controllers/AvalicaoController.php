<?php

namespace App\Http\Controllers;

use App\Models\AvalicaoCompetencia;
use App\Models\AvalicaoUsers;
use App\Models\Competencia;
use App\Models\Empresa;
use App\Models\TipoCompetencia;
use App\Repositories\AvalicaoRepository;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class AvalicaoController extends Controller
{
    private $repository;

    public function __construct(AvalicaoRepository $repository)
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

    public function save(Request $request, $id)
    {

    }

    public function salve(Request $request, $id)
    {
        $avalicao = new \App\Models\Avalicoe($request->all());
        $empresa = \App\Models\Empresa::find($id);

        $dados = $empresa->avalicoes()->save($avalicao);

        return response()->json($dados);
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
        $avaliacao = DB::table('avalicoes')->where('empresa_id',$id)->paginate(8);

        return $avaliacao;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return $this->repository->find($id);
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
        $result = $this->repository->update($request->all(), $id);

        if ($result) {
            return response()->json(['error' => false, 'message' => 'dados atualizado com sucesso']);
        } else {
            return response()->json(['error' => true, 'message' => 'Erro ao atualizar dados']);
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

    public function avaliado(Request $request)
    {

        $where = ['avalidado_id' => $request->input('avalido_id'), 'avalicao_id' => $request->input('avalicao')];


        $avalido = DB::table('avalicao_users')
            ->join('users', 'users.id', '=', 'avalicao_users.avalidador_id')
            ->join('dados_users', 'users.id', '=', 'dados_users.user_id')
            ->join('departamento_cargos', 'departamento_cargos.id', '=', 'dados_users.departamento_cargos_id')
            ->join('departamentos', 'departamentos.id', '=', 'departamento_cargos.departamento_id')
            ->join('cargos', 'cargos.id', '=', 'departamento_cargos.cargo_id')
            ->where($where)
            ->select(
                'users.id',
                'users.name',
                'cargos.nome as cargos',
                'departamentos.nome as departamento',
                'avalicao_users.tipo_id'

            )
            ->get();

        return $avalido;
    }

    public function avaliadores(Request $request)
    {

        $where = ['avalidador_id' => $request->input('avaliador_id'), 'avalicao_id' => $request->input('avalicao')];


        $avalido = DB::table('avalicao_users')
            ->join('users', 'users.id', '=', 'avalicao_users.avalidado_id')
            ->join('dados_users', 'users.id', '=', 'dados_users.user_id')
            ->join('departamento_cargos', 'departamento_cargos.id', '=', 'dados_users.departamento_cargos_id')
            ->join('departamentos', 'departamentos.id', '=', 'departamento_cargos.departamento_id')
            ->join('cargos', 'cargos.id', '=', 'departamento_cargos.cargo_id')
            ->where($where)
            ->select(
                'users.id',
                'users.name',
                'cargos.nome as cargos',
                'departamentos.nome as departamento',
                'avalicao_users.tipo_id'

            )
            ->get();

        return $avalido;
    }

    public function  saveAvaliado(Request $request)
    {
        $where = ['avalicao_id' => $request->input('avalicao_id'), 'avalidado_id' => $request->input('avalidado_id'), 'avalidador_id' => $request->input('avalidador_id')];

        $avalicao_user = DB::table('avalicao_users')->where($where)->first();

        if (count($avalicao_user) > 0) {
            $return = AvalicaoUsers::where($where)
                ->update(['tipo_id' => $request->input('tipo_id')]);
            return $return;
        } else {
            $avalicao = new AvalicaoUsers;
            $avalicao->avalicao_id = $request->input('avalicao_id');
            $avalicao->avalidado_id = $request->input('avalidado_id');
            $avalicao->avalidador_id = $request->input('avalidador_id');
            $avalicao->tipo_id = $request->input('tipo_id');
            $return = $avalicao->save();

            if ($return) {
                return $avalicao;
            }

        }

    }

    public function  removeAvaliadadores(Request $request, $id)
    {
        $where = ['avalicao_id' => $id, 'avalidado_id' => $request->input('avalidado_id'), 'avalidador_id' => $request->input('avalidador_id')];

        AvalicaoUsers::where($where)->delete();

    }

    public function  removeAvaliado(Request $request, $id)
    {

        $where = ['avalicao_id' => $id, 'avalidado_id' => $request->input('avalidado_id'), 'avalidador_id' => $request->input('avalidador_id')];

        AvalicaoUsers::where($where)->delete();

    }

    public function competencia(Request $request, $id)
    {

        $where = ['empresas.id' => $id];

        $competencia = DB::table('competencia_tipos')
            ->join('competencias', 'competencias.id', '=', 'competencia_tipos.competencia_id')
            ->join('tipo_competencias', 'tipo_competencias.id', '=', 'competencia_tipos.tipo_id')
            ->join('empresas', 'empresas.id', '=', 'competencias.empresa_id')
            ->where($where)
            ->whereNotIn('competencias.id', $request->input('id'))
            ->select(
                'competencias.id',
                'competencias.nome as competencias',
                'tipo_competencias.nome as tipo',
                'competencias.descricao',
                DB::raw('(SELECT COUNT(comportamentos.id) FROM comportamentos WHERE comportamentos.competencia_id = competencias.id) as total'),
                'competencias.updated_at'
            )
            ->orderBy('competencias.id', 'ASC')->paginate(8);


        return $competencia;


    }

    public function  saveCompetencia(Request $request, $id)
    {
        $compete_avalicao = ['competencia_id' => $request->input('id'), 'avalicao_id' => $id];

        $avaliacao_competencia = new AvalicaoCompetencia($compete_avalicao);

        $return = $avaliacao_competencia->save();

        if ($return) {
            return $avaliacao_competencia;
        }

    }

    public function avaliaCompetencia(Request $request, $id)
    {

        $where = ['empresas.id' => $id, 'avalicao_competencias.avalicao_id' => $request->input('id')];


        $competencia = DB::table('competencia_tipos')
            ->join('competencias', 'competencias.id', '=', 'competencia_tipos.competencia_id')
            ->join('tipo_competencias', 'tipo_competencias.id', '=', 'competencia_tipos.tipo_id')
            ->join('empresas', 'empresas.id', '=', 'competencias.empresa_id')
            ->join('avalicao_competencias', 'avalicao_competencias.competencia_id', '=', 'competencias.id')
            ->where($where)
            ->select(
                'competencias.id',
                'competencias.nome as competencias',
                'tipo_competencias.nome as tipo',
                'competencias.descricao',
                DB::raw('(SELECT COUNT(comportamentos.id) FROM comportamentos WHERE comportamentos.competencia_id = competencias.id) as total'),
                'competencias.updated_at'
            )
            ->orderBy('competencias.id', 'ASC')->get();


        return $competencia;

    }

    public function comportamentoCompetencia(Request $resquest, $id)
    {

        $where = ['competencias.empresa_id' => $id];



        $comportamento = DB::table('competencias')
            ->join('comportamentos', 'competencias.id', '=', 'comportamentos.competencia_id')
            ->where($where)
            ->whereIn('comportamentos.competencia_id', $resquest->input('id'))
            ->select(
                'comportamentos.id',
                'comportamentos.nome',
                'comportamentos.competencia_id'
            )
            ->orderBy('competencia_id', 'ASC')->get();

        return $comportamento;

    }
}
