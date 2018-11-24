% rebase('layout.tpl', title='Info', year=2018)
<form name="frmEditPokemon" action="/add_post" method="post">
		<table class="table">
		<tr>
			<td class="col-md-2">Title</td>
			<td class="col-md-2"><input type="text" name="txtTitle" class="form-control"></td>
		</tr>
		<tr>
			<td class="col-md-2">Text</td>
			<td class="col-md-2"><input type="text" name="txtText" class="form-control"></td>
		</tr>
		<tr>
			<td class="col-md-2">Tags</td>
			<td class="col-md-2"><input type="text" name="txtTags" class="form-control"></td>
		<tr>
			<td class="col-md-2"></td></a>
			<td class="col-md-2">
				<input class="btn btn-primary" type="submit" value="Submit">
				<a class="btn btn-primary" href="/" role="button">Back</a>
			</td>
		</tr>
	</table>
</form>