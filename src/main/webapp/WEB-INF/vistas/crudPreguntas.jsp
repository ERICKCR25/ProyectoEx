<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="esS">
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- CSS personalizado -->
<link rel="stylesheet" href="bootstrap/css/main.css">
<!--datables CSS básico-->
<link rel="stylesheet" type="text/css"
	href="datatables/datatables.min.css" />
<!--datables estilo bootstrap 4 CSS-->
<link rel="stylesheet" type="text/css"
	href="datatables/DataTables-1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="css/bootstrapValidator.css" />
<title>Crea Preguntas</title>
</head>
<body>

	<div class="container-fluid">

		<div class="container">
			<form id="idFormElimina" action="eliminaPregunta">
				<input type="hidden" id="id_elimina" name="id">
			</form>			
			<header>
				<h1 class="text-center text-light">CREAR PREGUNTAS</h1>
				<h2 class="text-center text-light">
					Empecemos <span class="badge badge-danger">¡Ahora!</span>
				</h2>
			</header>
			<div style="height: 50px"></div>


			<form action="listaPreguntas" id="formLista" accept-charset="UTF-8">
				<div class="form-row align-items-inline" id="filtro">
					<div class="col-md-9">
						<label class="sr-only" for="inlineFormInputGroup">id pregunta</label>
						<div class="input-group mb-2">
							<div class="input-group-prepend">
								<div class="input-group-text">
									<i class="fas fa-search"></i>
								</div>
							</div>
							<input type="text" class="form-control" id="id_nonbre_filtro"
								name="filtro" placeholder="Nombre de examen">
						</div>
					</div>
					<div class="col-auto">
						<button type="submit" class="btn btn-primary">buscar</button>
					</div>
					<div class="col-auto">
						<button type="button" data-toggle='modal' onclick="registrar();"
							class="btn btn-warning">
							<i class="far fa-plus-square"></i> Nueva pregunta
						</button>
					</div>
				</div>
			</form>


			<div class="table-responsive ">
				<table id="tablaExamen"
					class="table table-striped table-bordered table-hover text-center"
					style="width: 100%">
					<thead class="thead-dark">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Número</th>
							<th scope="col">Enunciado</th>
							<th scope="col">Valor Parcial</th>
							<th scope="col">Materia</th>
							<th scope="col">id Examen</th>
							<th scope="col">Actualiza</th>
							<th scope="col">Elimina</th>
							<th scope="col">Agregar Preg</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${preguntas}" var="x">
							<tr>
								<td>${x.idPregunta}</td>
								<td>${x.nPregunta}</td>
								<td>${x.enunciado}</td>
								<td>${x.valorParcial}</td>
								<td>${x.idMateria}</td>
								<td>${x.idExamen}</td>
								<td>
									<button type='button' data-toggle='modal'
										onclick="editar('${x.idPregunta}', '${x.enunciado}', '${x.valorTotal}', '${x.idMateria}');"
										class='btn btn-success'>
										<i class="far fa-edit"></i>
									</button>
								</td>
								<td>
									<button type='button' data-toggle='modal'
										onclick="eliminar('${x.idPregunta}');" class="btn btn-danger">
										<i class="far fa-trash-alt"></i>
									</button>
								</td>
								<td>
									<button type='button' data-toggle='modal'
										onclick="agregar('${x.idexamen}');"
										class="btn btn-warning">
										<i class="far fa-plus-square"></i>
									</button>
								</td>
							</tr>


						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="modal fade" id="idModalRegistra" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header "
							style="padding: 35px 50px; text-align: center; background-color: #ACB8BF;">
							<h4 style="margin: auto;">
								<i class="fas fa-file-medical"></i>&nbsp;Registra Pregunta
							</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form id="modal_form_registra" accept-charset="UTF-8"
								action="registraPregunta" class="form-horizontal" method="post">
								<div class="form-group">
									<label for="id_reg_numero" class="col-form-label">Numero:</label>
									<input type="text" class="form-control" id="id_reg_numero"
										name="numero" placeholder="Ingrese el número">
								</div>
								<div class="form-group">
									<label for="id_reg_enunciado" class="col-form-label">Enunciado:</label>
									<input type="text" class="form-control" id="id_reg_enunciado"
										name="enunciado" placeholder="Ingrese La enunciado">
								</div>
								<div class="form-group">
									<label for="id_reg_valorParcial" class="col-form-label">Puntaje:</label>
									<input type="text" class="form-control" id="id_reg_valorParcial"
										name="valorParcial" placeholder="Ingrese valorParcial">
								</div>
								
								<div class="form-group">
									<label for="id_reg_tipoPregunta">Materia</label> 
									<select class="custom-select" id="id_reg_materia">
										<option value="">Seleccione</option>
										<option value="1">RV</option>
										<option value="2">RM</option>
										<option value="3">Algebra</option>
										<option value="4">Aritmetica</option>
										<option value="5">Geometria</option>
										<option value="6">Trigonometria</option>
										<option value="7">Literatura</option>
										<option value="8">Química</option>
										<option value="9">Física</option>
										<option value="10">Biología</option>
									</select>
								</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">REGISTRAR</button>
						</div>
						</form>
					</div>
				</div>
			</div>


			<div class="modal fade" id="idModalActualiza" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header "
							style="padding: 35px 50px; text-align: center; background-color: #31A7EA;">
							<h4 style="margin: auto;">
								<i class="fas fa-file-medical"></i>&nbsp;Editar Pregunta
							</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form id="modal_form_actualiza" action="actualizaPregunta"
								class="form-horizontal" method="post">
								<div class="form-group">
									<label for="id_ID" class="col-form-label">ID Pregunta:</label> 
									<input class="form-control" id="id_act_idpregunta" name="idpregunta" readonly="readonly" type="text">
								</div>
								<div class="form-group">
									<label for="id_act_nombre" class="col-form-label">numero:</label>
									<input type="text" class="form-control" id="id_act_numero"
										name="numero" placeholder="Ingrese el numero">
								</div>
								<div class="form-group">
									<label for="id_act_enunciado" class="col-form-label">enunciado:</label>
									<input type="text" class="form-control" id="id_act_enunciado"
										name="enunciado" placeholder="Ingrese La enunciado">
								</div>
								<div class="form-group">
									<label for="id_act_valorParcial" class="col-form-label">Puntaje:</label>
									<input type="text" class="form-control" id="id_act_valorParcial"
										name="valorParcial" placeholder="Ingrese valorParcial">
								</div>
								
								<div class="form-group">
									<label for="id_act_tipoPregunta">Materia</label> 
									<select class="custom-select" id="id_act_materia">
										<option value="">Seleccione</option>
										<option value="1">RV</option>
										<option value="2">RM</option>
										<option value="3">Algebra</option>
										<option value="4">Aritmetica</option>
										<option value="5">Geometria</option>
										<option value="6">Trigonometria</option>
										<option value="7">Literatura</option>
										<option value="8">Química</option>
										<option value="9">Física</option>
										<option value="10">Biología</option>
									</select>
								</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">ACTUALIZAR</button>
						</div>
						</form>
					</div>
				</div>
			</div>


		</div>
	</div>



	<script src="jquery/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- datatables JS -->
	<script type="text/javascript" src="datatables/datatables.min.js"></script>
	<script src="https://kit.fontawesome.com/2e81971293.js"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		function eliminar(id) {
			$('input[id=id_elimina]').val(id);
			$('#idFormElimina').submit();
		}		
		function registrar() {
			$('#idModalRegistra').modal("show");
		}

		function editar(idpregunta, numero, enunciado, valorTotal,materia) {
			$('input[id=id_act_idpregunta]').val(idexamen);
			$('input[id=id_act_numero]').val(numero);
			$('input[id=id_act_enunciado]').val(enunciado);
			$('input[id=id_act_valorParcial]').val(valorparcial);
			$('input[id=id_act_materia]').val(materia);
			$('#idModalActualiza').modal("show");
		}

		$(document)
				.ready(
						function() {
							$('#tablaExamen')
									.DataTable(
											{
												//para cambiar el lenguaje a español
												"language" : {
													"lengthMenu" : "Mostrar _MENU_ registros",
													"zeroRecords" : "No se encontraron resultados",
													"info" : "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
													"infoEmpty" : "Mostrando registros del 0 al 0 de un total de 0 registros",
													"infoFiltered" : "(filtrado de un total de _MAX_ registros)",
													"sSearch" : "Buscar:",
													"oPaginate" : {
														"sFirst" : "Primero",
														"sLast" : "Último",
														"sNext" : "Siguiente",
														"sPrevious" : "Anterior"
													},
													"sProcessing" : "Procesando...",
												}
											});
						});
	</script>

	<script type="text/javascript">
		$('#id_form_registra')
				.bootstrapValidator(
						{
							message : 'This value is not valid',
							feedbackIcons : {
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh'
							},
							fields : {
								nombre : {
									selector : '#id_reg_nombre',
									validators : {
										notEmpty : {
											message : 'El nombre es un campo obligatorio'
										},
										stringLength : {
											message : 'El nombre es de 5 a 100 caracteres',
											min : 5,
											max : 100
										}
									}
								},
								fechaInicio : {
									selector : '#id_reg_descripcion',
									validators : {
										notEmpty : {
											message : 'La descricpcion es un campo obligatorio'
										},
										stringLength : {
											message : 'El nombre es de 5 a 100 caracteres',
											min : 5,
											max : 100
										}
									}
								},
								fechaFin : {
									selector : '#id_reg_valorTotal',
									validators : {
										notEmpty : {
											message : 'El valor total es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]{1,3}$/,
											message : 'La nota maxima debe ser de 3 digitos como maximo'
										}
									}
								},
								estado : {
									selector : '#id_reg_valorAprobatorio',
									validators : {
										notEmpty : {
											message : 'El estado es un campo obligatorio'
										},
										regexp : {
											regexp : /^[0-9]{1,3}$/,
											message : 'el valor aprobatorio debe ser de 3 digitos como maximo'
										}
									}
								},
							}
						});
	</script>

</body>
</html>

