<?php    
                    if(isset($_REQUEST['guardar'])){

                        $descImg = $_POST['txtDesImagen'];
                        $catalogo = $_POST['cmbCatalogo'];
                        $noPag = $_POST['txtNoP'];
                        $color = $_POST['cmbColorD'];

                        if(isset($_FILES['foto']['name'])){
                            $tipoArchivo = $_FILES['foto']['type'];
                            $nombreArchivo = $_FILES['foto']['name'];
                            $tamanoArchivo = $_FILES['foto']['size'];
                            
                            $imagenSubida = fopen($_FILES['foto']['tmp_name'],'rb');
                            $binariosImagen = fread($imagenSubida,$tamanoArchivo);
                            include("./conexion/conexion-mysql.php");
                           $binariosImagen = mysqli_escape_string($conexion,$binariosImagen);
                           echo $sql = 'INSERT INTO diseno VALUES(default,"'.$binariosImagen.'"
                            ,"'.$descImg.'",'.$catalogo.',"'.$noPag.'",'.$color.',"'.$tipoArchivo.'")';
                            $res = mysqli_query($conexion,$sql);
                            if($res){
                                    header("location:Ad_Diseno.php");
                            }else{
                           
                                    echo mysqli_error($conexion);
                                
                            }

                        }
                    }
                    mysqli_close($conexion);
                ?>