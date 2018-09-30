<section class="container" style="margin-top: 20px">


    <label><input id="search" value="" class="form-control" placeholder="Search"/></label>

    <table style="margin-top: 5px;">
        <thead>
        <tr>
            <th>Name</th>
            <th>Type</th>
        </tr>
        </thead>
        <tbody id="myTable">
        {foreach $pokemons as $item}
            <tr>
                <td>{$item['name']}</td>
                <td>{$item['type']}</td>
            </tr>
            {foreachelse}
        {/foreach}
        </tbody>
    </table>
</section>