{include file="header.html.tpl"}

<div class="container-fluid mt-5">

    {if isset($message)}
        <div class="alert alert-success" role="alert">{$message}</div>
    {/if}
    {if isset($error)}
        <div class="alert alert-danger" role="alert">{$error}</div>
    {/if}
    {if isset($felgi)}
        {if $felgi|@count === 0}
            <div class="alert alert-primary" role="alert">
                Brak felg w Bazie
            </div>
        {else}
            <div class="row m-5">
                <div class="col-8">
                    <h2 class="text-center mb-5">Wybierz felgi</h2>


                    <form action="http://{$smarty.server.HTTP_HOST}{$subdir}Swiatla" method="post">

                        <h4>Obręcze kół - standardowe</h4>
                        {foreach $felgi as $key => $Wartosc}

                            {if {$Wartosc['id_Opcja']} == 1}
                                <div class="form-check form-check-inline">
                                   <input class="form-check-input" type="radio" name="id_SamochodKola"  id="inlineRadio{$Wartosc['id_SamochodKola']}" value="{$Wartosc['id_SamochodKola']}" required>

                                    <label class="form-check-label" for="inlineRadio{$Wartosc['id_SamochodKola']}">
                                        <div>
                                            <img src="http://{$smarty.server.HTTP_HOST}/{$sciezka}/Felgi/{$Wartosc['foto']}"
                                                 class="img-fluid" alt="Responsive image">
                                            <p>{$Wartosc['nazwa']}</p>
                                        </div>
                                    </label>
                                </div>
                            {/if}


                        {/foreach}

                        <h4>Obręcze kół - opcjonalne</h4>

                        {foreach $felgi as $key => $Wartosc}

                            {if {$Wartosc['id_Opcja']} == 2}
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="id_SamochodKola"  id="inlineRadio{$Wartosc['id_SamochodKola']}" value="{$Wartosc['id_SamochodKola']}" required>

                                    <label class="form-check-label" for="inlineRadio{$Wartosc['id_SamochodKola']}">
                                        <div>
                                            <img src="http://{$smarty.server.HTTP_HOST}/{$sciezka}/Felgi/{$Wartosc['foto']}"
                                                 class="img-fluid" alt="Responsive image">
                                            <p>{$Wartosc['nazwa']}</p>
                                        </div>
                                    </label>
                                </div>
                            {/if}


                        {/foreach}


                        <div class="text-right">
                            <button type="submit" class="btn btn-primary">Wybierz &#8594;</button>
                        </div>


                    </form>


                </div>


                <div class="col-4">

                    <h2 class="text-center mb-5">Postęp</h2>

                    <div class="progress">
                        <div class="progress-bar" role="progressbar" style="width: 45%" aria-valuenow="25"
                             aria-valuemin="0" aria-valuemax="100"></div>
                    </div>


                    {foreach $ZbiorModeli as $key => $wartosc1}
                        {if {$wartosc1['id_ZbiorModeli']} == {$smarty.session.id_ZbiorModeli}}
                            <img src="http://{$smarty.server.HTTP_HOST}/{$sciezka}{$wartosc1['foto']}" class="img-fluid"
                                 alt="Responsive image">
                            <h4>Model: {$wartosc1['nazwa']}</h4>
                            <h4>Wersja: {$wartosc1['wersja_nazwa']} </h4>
                        {/if}
                    {/foreach}

                    {foreach $silnik as $key => $wartosc2}
                        {if {$wartosc2['id_SamochodParametry']} == {$smarty.session.id_SamochodParametry}}
                            <h4>Silnik: {$wartosc2['pojemnosc']} l {$wartosc2['moc']} KM {$wartosc2['silnik']}
                                ({$wartosc2['skrzynia']})</h4>
                        {/if}
                    {/foreach}

                    {foreach $felgi as $key => $wartosc3}
                        {if {$wartosc3['id_SamochodKola']} == {$smarty.session.id_SamochodKola}}
                            <h4>Felgi: {$wartosc3['nazwa']}</h4>
                            <img src="http://{$smarty.server.HTTP_HOST}/{$sciezka}/Felgi/{$wartosc3['foto']}"
                                 class="img-fluid" alt="Responsive image">
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
                            <img src="http://{$smarty.server.HTTP_HOST}/{$sciezka}/Lakier/{$wartosc6['Foto']}"
                                 class="img-fluid" alt="Responsive image">
                        {/if}
                    {/foreach}

                </div>
            </div>
            <div>
                <div class="text-left">
                    <a class="btn btn-success ml-5 mb-5" href="http://{$smarty.server.HTTP_HOST}{$subdir}Silnik">&#8592;
                        Silnik (do zrobienia)</a>
                </div>

                <!--

                {if isset($smarty.session.idsilnik)}
                    <div class="text-right">
                        <a class="btn btn-success mr-5"
                           href="http://{$smarty.server.HTTP_HOST}{$subdir}Skrzynia/{$smarty.session.idsilnik}">Skrzynia
                            &#8594;</a>
                    </div>
                {/if}

                -->

            </div>
        {/if}
    {/if}
</div>


{include file="footer.html.tpl"}