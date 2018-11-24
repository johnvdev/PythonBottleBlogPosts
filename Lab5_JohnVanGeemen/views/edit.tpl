% rebase('layout.tpl', title='Info', year=2018)

<form name="frmEditPost" action="/edit_post" method="post">
	<table class="table">
		<tr>
			<td class="col-md-2">ID</td>
			<td class="col-md-2"><input type="hidden"  name="txtID" value='{{post["_id"]}}'>{{post["_id"]}}</td>
		</tr>
		<tr>
			<td class="col-md-2">Title</td>
			<td class="col-md-2"><input type="text" name="txtTitle" value='{{post["post_title"]}}' class="form-control"></td>
		</tr>
		<tr>
			<td class="col-md-2">Text</td>
			<td class="col-md-2"><input type="text" name="txtText" value='{{post["post_text"]}}' class="form-control"></td>
		<tr>
			<td class="col-md-2">Height</td>
			<td class="col-md-2"><input type="tags" name="txtTags" value='{{post["post_tags"]}}' class="form-control"></td>
		</tr>
		<tr>
			<td class="col-md-2"></td></a>
			<td class="col-md-2">
				<input class="btn btn-primary" type="submit" value="Submit">
				<a class="btn btn-primary" href="/" role="button">Back</a>
			</td>
		</tr>
	</table>
</form>
