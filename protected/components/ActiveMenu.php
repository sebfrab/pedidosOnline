<?php

Yii::import('zii.widgets.CMenu', true);

class ActiveMenu extends CMenu
{
    public function init()
    {
        $auth=Yii::app()->authManager;
        $items = Categoria::model()->findAll();
        
        $count=0;
        if($auth->checkAccess('lista_productos',Yii::app()->user->id)){
            foreach ($items as $item){
                $this->items[$count] = array('label'=>strtoupper($item->nombre).' <b class="caret"></b>', 'url'=>'#', 'linkOptions'=>array(
                                                                'class'=>'dropdown-toggle',
                                                                'data-toggle'=>'dropdown',
                                                            ),
                    'visible'=>$auth->checkAccess('lista_productos',Yii::app()->user->id));
                foreach($item->subcategoria as $sub){
                    $this->items[$count]["items"][] = array('label'=>$sub->nombre, 'url'=>array('/listProductos/index/'.$sub->idsubcategoria));
                }
                $count++; 
            }
        }
        if(Yii::app()->user->isGuest){
            $this->items[$count] = array('label'=>'AYUDA <b class="caret"></b>', 'url'=>'#','visible'=>Yii::app()->user->isGuest,'linkOptions'=>array('class'=>'dropdown-toggle','data-toggle'=>'dropdown',));
                $this->items[$count]["items"][] = array('label'=>'Modo de uso', 'url'=>array('/site/support'));  
                $this->items[$count]["items"][] = array('label'=>'Términos y Condiciones', 'url'=>Yii::app()->request->baseUrl.'/images/condiciones.pdf', 'linkOptions'=>array('class'=>'fancypdf'));
            $count++; 
            $this->items[$count] = array('label'=>'CONTACTO', 'url'=>array('/site/index#contacto'),'visible'=>Yii::app()->user->isGuest);
        }        
    }
}
?>
