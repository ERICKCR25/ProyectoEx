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
<title>Crea Examen</title>
</head>
<body>

	<div class="container-fluid">

		<div class="container">
			<form id="idFormElimina" action="eliminaExamen">
				<input type="hidden" id="id_elimina" name="id">
			</form>
			<form id="idFormAgrega" action="agregaPreguntas" method="post">
				<input type="hidden" id="id_examen" name="id_examen"> <input
					type="hidden" accept-charset="UTF-8" id="id_nombre"
					name="id_nombre"> <input type="hidden"
					accept-charset="UTF-8" id="id_descripcion" name="id_descripcion">
			</form>
			<header>
				<h1 class="text-center text-light">CREAR EXAMENES</h1>
				<h2 class="text-center text-light">
					Empecemos <span class="badge badge-danger">¡Ahora!</span>
				</h2>
			</header>
			<div style="height: 50px"></div>


			<form action="listaExamen" id="formLista" accept-charset="UTF-8">
				<div class="form-row align-items-inline" id="filtro">
					<div class="col-md-9">
						<label class="sr-only" for="inlineFormInputGroup">nombre</label>
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
							<i class="far fa-plus-square"></i> Nuevo Examen
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
							<th scope="col">Nombre</th>
							<th scope="col">Descripcion</th>							
							<th scope="col">Nota Aprobatoria</th>
							<th scope="col">Actualiza</th>
							<th scope="col">Elimina</th>							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${examenes}" var="x">
							<tr>
								<td>${x.idexamen}</td>
								<td>${x.nombre}</td>
								<td>${x.descripcion}</td>								
								<td>${x.valorAprobatorio}</td>
								<td>
									<button type='button' data-toggle='modal'
										onclick="editar('${x.idexamen}', '${x.nombre}', '${x.descripcion}', '${x.valorAprobatorio}');"
										class='btn btn-success'>
										<i class="far fa-edit"></i>
									</button>
								</td>
								<td>
									<button type='button' data-toggle='modal'
										onclick="eliminar('${x.idexamen}');" class="btn btn-danger">
										<i class="far fa-trash-alt"></i>
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
								<i class="fas fa-file-medical"></i>&nbsp;Registro de Examen
							</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form id="modal_form_registra" accept-charset="UTF-8"
								action="registraExamen" class="form-horizontal" method="post">
								<div class="form-group">
									<label for="id_reg_nombre" class="col-form-label">Nombre:</label>
									<input type="text" class="form-control" id="id_reg_nombre"
										name="nombre" placeholder="Ingrese el Nombre">
								</div>
								<div class="form-group">
									<label for="id_reg_descripcion" class="col-form-label">Descripcion:</label>
									<input type="text" class="form-control" id="id_reg_descripcion"
										name="descripcion" placeholder="Ingrese La descripcion">
								</div>
								<div class="form-group">
									<label for="id_reg_valorTotal" class="col-form-label">Puntajemáximo:</label> <input type="text" class="form-control" id="id_reg_valorTotal" name="valorTotal" placeholder="Ingrese el puntaje máximo">
								</div>
								<div class="form-group">
									<label for="id_reg_valorAprobatorio" class="col-form-label">Puntaje Aprobatorio</label> <input type="text" class="form-control"
										id="id_reg_valorAprobatorio" name="valorAprobatorio"
										placeholder="Ingrese el puntaje Aprobatorio">
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
								<i class="fas fa-file-medical"></i>&nbsp;Editar Examen
							</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form id="modal_form_actualiza" action="actualizaExamen"
								class="form-horizontal" method="get">
								<div class="form-group">
									<label for="id_ID" class="col-form-label">ID del
										examen:</label> <input class="form-control" id="id_act_idexamen" name="idexamen" readonly="readonly" type="text">
								</div>
								<div class="form-group">
									<label for="id_act_nombre" class="col-form-label">Nombre:</label>
									<input type="text" class="form-control" id="id_act_nombre"
										name="nombre" placeholder="Ingrese el Nombre">
								</div>
								<div class="form-group">
									<label for="id_act_descripcion" class="col-form-label">Descripcion:</label>
									<input type="text" class="form-control" id="id_act_descripcion"
										name="descripcion" placeholder="Ingrese La descripcion">
								</div>								
								<div class="form-group">
									<label for="id_act_valorAprobatorio" class="col-form-label">Puntaje Aprobatorio</label> <input type="text" class="form-control" id="id_act_valorAprobatorio" name="valorAprobatorio" placeholder="Ingrese el puntaje Aprobatorio">
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
		function agregar(id, nombre, descripcion) {
			$('input[id=id_examen]').val(id);
			$('input[id=id_nombre]').val(nombre);
			$('input[id=id_descripcion]').val(descripcion);
			$('#idFormAgrega').submit();
		}
		function registrar() {
			$('#idModalRegistra').modal("show");
		}

		function editar(idexamen, nombre, descripcion, valorAprobatorio) {
			$('input[id=id_act_idexamen]').val(idexamen);
			$('input[id=id_act_nombre]').val(nombre);
			$('input[id=id_act_descripcion]').val(descripcion);			
			$('input[id=id_act_valorAprobatorio]').val(valorAprobatorio);
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
