This module is was based on another I saw in the repository that was done to make database backups but also suited to do file and other options for files

http://www.yiiframework.com/extension/backup/

Module with translations in Spanish only

images
[Demo 1](https://bitbucket.org/juanda1015/jbackup/downloads/demo%20jbackup.png "Demo")
[Demo 2](https://bitbucket.org/juanda1015/jbackup/downloads/demo%20jbackup2.png "Demo")

Note: only been tested with MySQL and yii 1.1 or above

##Requirements

Requirements of using this extension (e.g. Yii 1.1 or above)...

##Usage

You can download the module from bitbucket [Repository](https://bitbucket.org/juanda1015/jbackup/), and place it in your modules directory or make clone

You change your config / main and place the following:

~~~
[php]
..... other parameters
'modules'=>array(
                'jbackup'=>array(
                    'path' => __DIR__.'/../_backup/', //Directory where backups are saved
                    'layout' => '//layouts/_column2', //2-column layout to display the options
                    'filter' => 'accessControl', //filter or filters to the controller
                    'bootstrap' => false, //if you want the module use bootstrap components
                    'download' => true, // if you want the option to download
                    'restore' => true, // if you want the option to restore
                    'database' => true, //whether to make backup of the database or not
                    //directory to consider for backup, must be made array key => value array ($ alias => $ directory)
                    'directoryBackup'=>array( 
                       'folder/'=> __DIR__.'/../../folder/',
                    ),
                    //directory sebe not take into account when the backup
                    'excludeDirectoryBackup'=>array(
                       __DIR__.'/../../folder/folder2/',
                    ),
                    //files sebe not take into account when the backup
                    'excludeFileBackup'=>array(
                       __DIR__.'/../../folder/folder1/cfile.png',
                    ),
                    //directory where the backup should be done default Yii::getPathOfAlias('webroot')
                    'directoryRestoreBackup'=>__DIR__.'/../../' 
                 ),
......other parameters
~~~
