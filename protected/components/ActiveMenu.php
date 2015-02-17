<?php

Yii::import('zii.widgets.CMenu', true);

class ActiveMenu extends CMenu
{
    public function init()
    {
        
        $items = Categoria::model()->findAll();
        
        $count=0;
        foreach ($items as $item){
            $this->items[$count] = array('label'=>strtoupper($item->nombre).' <b class="caret"></b>', 'url'=>'#', 'linkOptions'=>array(
                                                            'class'=>'dropdown-toggle',
                                                            'data-toggle'=>'dropdown',
                                                        ),);
            foreach($item->subcategoria as $sub){
                $this->items[$count]["items"][] = array('label'=>$sub->nombre, 'url'=>array('/listProductos/index/'.$sub->idsubcategoria));
            }
            $count++; 
        }
        
    }
}
?>
