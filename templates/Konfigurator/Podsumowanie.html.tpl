{include file="header.html.tpl"}

<div class="container-fluid mt-5">

    <h2 class="text-center mb-5">Podsumowanie</h2>

    {if isset($error)}
        <div class="alert alert-danger" role="alert">{$error}</div>
    {/if}


    {if isset($smarty.session.numer)}
    <div class="alert alert-success" role="alert">
        <!-- Numer konfiguracji:{$smarty.session.numer} -->

    </div>


    {else}

    <div class="container text text-center">


        {foreach $ZbiorModeli as $key => $wartosc1}
            {if {$wartosc1['id_ZbiorModeli']} == {$smarty.session.id_ZbiorModeli}}
                <img src="http://{$smarty.server.HTTP_HOST}/{$sciezka}{$wartosc1['foto']}" class="img-fluid" alt="Responsive image">
                <h4>Model: {$wartosc1['nazwa']}</h4>
                <h4>Wersja: {$wartosc1['wersja_nazwa']} </h4>
            {/if}
        {/foreach}

        {foreach $silnik as $key => $wartosc2}
            {if {$wartosc2['id_SamochodParametry']} == {$smarty.session.id_SamochodParametry}}
                <h4>Silnik: {$wartosc2['pojemnosc']} l {$wartosc2['moc']} KM {$wartosc2['silnik']} ({$wartosc2['skrzynia']})</h4>
            {/if}
        {/foreach}

        {foreach $felgi as $key => $wartosc3}
            {if {$wartosc3['id_SamochodKola']} == {$smarty.session.id_SamochodKola}}
                <h4>Felgi: {$wartosc3['nazwa']}</h4>
                <img src="http://{$smarty.server.HTTP_HOST}/{$sciezka}/Felgi/{$wartosc3['foto']}" class="img-fluid" alt="Responsive image">
            {/if}
        {/foreach}

        {foreach $swiatla as $key => $wartosc4}
            {if {$wartosc4['id_SamochodSwiatla']} == {$smarty.session.id_SamochodSwiatla}}
                <h4>Światła: {$wartosc4['nazwa']}</h4>
            {/if}
        {/foreach}

        {foreach $wyposazenie as $key => $wartosc5}
            {if {$wartosc5['id_SamochodWyposazenie']} == {$smarty.session.id_SamochodWyposazenie}}
                <h4>Wyposażenie dodatkowe: {$wartosc5['nazwa']}</h4>
            {/if}
        {/foreach}

        {foreach $lakier as $key => $wartosc6}
            {if {$wartosc6['IdLakier']} == {$smarty.session.IdLakier}}
                <h4>Lakier: {$wartosc6['nazwaLakier']}</h4>
                <img src="http://{$smarty.server.HTTP_HOST}/{$sciezka}/Lakier/{$wartosc6['Foto']}" class="img-fluid" alt="Responsive image">
            {/if}
        {/foreach}

    </div>


</div>


    </div>
{/if}

<div class="d-flex justify-content-center">
    <a class="btn btn-success m-5 text-center" href="http://{$smarty.server.HTTP_HOST}{$subdir}Samochod">Nowa
        Konfiguracja</a>
    {if !isset($smarty.session.numer)}
        <a class="btn btn-success m-5 text-center" href="http://{$smarty.server.HTTP_HOST}{$subdir}Konfigurator/zapisz">Zapisz
            konfiguracje</a>
    {/if}
    {if isset($smarty.session.user)}
        <a class="btn btn-success m-5 text-center"
           href="http://{$smarty.server.HTTP_HOST}{$subdir}Zamowienie/add-form/">Zamów</a>
    {/if}
</div>

</div>


{include file="footer.html.tpl"}