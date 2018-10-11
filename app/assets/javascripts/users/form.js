/* grobal $ */
var $animal = $(".animal_list li");
var $color = $(".color_list li");
var $preview = $("#preview");
var $animalValue = $("input[name='user[icon_animal]'")
var $colorValue = $("input[name='user[icon_color]'")

$(function(){
    $animalValue.val(undefined);
    $colorValue.val(undefined);

    $animal.click(function() {
        var aIndex = $(this).index();
        var cIndex = $colorValue.val();

        $animalValue.val(aIndex);

        if (!!cIndex) {
            $preview.attr('src',`/assets/animalicon/icon${aIndex}_${cIndex}.png`);
        } else {
            $preview.attr('src',`/assets/animalsilhouette/animal${aIndex}.png`);
        }
        
        // $.ajax({ 
        //     url: './',
        //     type: 'PATCH',
        //     data: { user: { icon_animal: index } },
        //     dataType: 'json',
        //     success: function(data){
        //     $('#icon > img').attr('src', data.src);
        //     } 
        // })
    });
        
    $(".color_list li").click(function() {
        var cIndex = $(this).index();
        var aIndex = $animalValue.val();

        $colorValue.val(cIndex);

        if (!!aIndex) {
            $preview.attr('src',`/assets/animalicon/icon${aIndex}_${cIndex}.png`);
        } else {
            $preview.attr('src',`/assets/coloricon/color${cIndex}`);
        }
        // $.ajax({ 
        //     url: './', 
        //     type: 'PATCH', 
        //     data: { user: { icon_color: index } }, 
        //     dataType: 'json', 
        //     success: function(data){ 
        //     $('#icon > img').attr('src', data.src); 
        //     } 
        // }) 
    }); 
});

