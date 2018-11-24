% rebase('layout.tpl', title='Home Page', year=2018)
<a href="/blog/add" class="btn btn-success" role="button">Add Post</a>
<form name="search" action="/home" method="get">
		Title:<input type="text"  name="txtTitle" value=''/>Text:<input type="text"  name="txtText" value=''/>Tags:<input type="text"  name="txtTags" value=''/> <input class="btn btn-primary" type="submit" value="Submit">
</form>
<table class="table">
    <tr>
        <th>Title</th>
        <th>Post Date</th>
        <th></th>
    </tr>
    % for b in blog_list:
    <tr>
        <td><a href="/blog/info/{{b['_id']}}"  role="button">{{b["post_title"]}}</a></td>
        <td>{{b["post_date"]}}</td>
  
        <td>
			<a href="/blog/edit/{{b['_id']}}" class="btn btn-info" role="button">Edit</a>
			<a href="/blog/delete/{{b['_id']}}" class="btn btn-info delete" role="button">Delete</a>
		</td>
    </tr>
    % end
</table>