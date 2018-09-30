<section class="container" style="margin-top: 20px">


    <label><input id="search_ajax" value="" class="form-control" placeholder="Search"/></label>

    <table style="margin-top: 5px;">
        <thead>
        <tr>
            <th>Name</th>
            <th>Type</th>
        </tr>
        </thead>
        <tbody id="myTable">

        </tbody>
    </table>
</section>

<script>
    function get_list() {
        var api = "{base_url()}frontend/ajax/get_pokemon";

        var key = $('#search_ajax').val().toLowerCase();
        if (key) {
            api += '?s=' + key;
        }

        $.ajax({
            url: api,
            type: 'GET',
            cache: false,
            success: function (string) {
                $('tbody').empty();
                var pokemons = JSON.parse(string);
                for (var i = 0; i < pokemons.length; i++) {
                    $('tbody').append('<tr><td>' + pokemons[i]['name'] + '</td><td>' + pokemons[i]['type'] + '</td></tr>');
                }
            },
            error: function () {

            }
        });
    }

    $(function () {
        get_list();
        $('#search_ajax').on('keyup', $.debounce(500, get_list));
    });
</script>