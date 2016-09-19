<?php

include('header.php');

$insertArray=array();

$errMsg="";$succMsg="";$err=0;

	

	$insertArray['optionname']=isset($_POST['name'])?cleanInputField($_POST['name']):'';

	$insertArray['optionPrice']=isset($_POST['price'])?cleanInputField($_POST['price']):0;


    $insertArray['description']=isset($_POST['description'])? $_POST['description'] :'';
    

    
    $insertArray['productImage']=isset($_FILES['image']['name'])?cleanInputField($_FILES['image']['name']):'';


if(isset($_POST['submit']))

{

	if($insertArray['optionname']==""){

		$errMsg="Please enter all mandatory fields";

	}

	else

	{
        if( $insertArray['productImage']!="") {

             $type= $_FILES['image']['type'];

             $ext = strtolower(substr(strrchr($_FILES['image']['name'], "."), 1));

            $insertArray['productImage']="prod_".date('dmyhis').$_FILES['image']['name'];

            $move=move_uploaded_file ($_FILES['image']['tmp_name'],'../public/uploads/products/'.$insertArray['productImage']);

            if($move=="")

            {

                $err=1;

                $errMsg="Failed to upload image";

            }



        }

		$ins=$catObj->insertcategory($insertArray,"options");

		$insertArray['optionname']='';

		$insertArray['optionPrice']=0;


		$succMsg="Data inserted successfully";

	}

}

?>

        

       <div id="page-wrapper">

            <div class="row">

                <div class="col-lg-12">

                    <h1 class="page-header">Product Options</h1>

                </div>

                <!-- /.col-lg-12 -->

            </div>

            <!-- /.row -->

            <div class="row">

                <div class="col-lg-12">

                    <div class="panel panel-default">

                        <div class="panel-heading">

                           Add Option

                        </div>

                        <div class="panel-body">

                            <div class="row">

                                <div class="col-lg-6">

                                    <form role="form" method="post" enctype="multipart/form-data" name="optform" id="optform">

                                    <?php if($errMsg!=""){?>

                                   <div class="alert alert-danger">

                                            <label><?php echo $errMsg;?></label>

                                        </div>

                                    <?php } ?>

                                     <?php if($succMsg!=""){?>

                                  <div class="alert alert-success">

                                            <label><?php echo $succMsg;?></label>

                                        </div>

                                    <?php } ?>

                                    

                                    

                                        <div class="form-group">

                                            <label>Name <span class="error">*</span></label>

                                            <input class="form-control" name="name" id="name" value="<?php echo $insertArray['optionname'];?>">

                                        </div>

                                         <div class="form-group">

                                            <label>Price <span class="error">*</span></label>

                                            <input class="form-control" name="price" id="price" value="<?php echo $insertArray['optionPrice'];?>">

                                        </div>
                                        <div class="form-group">

                                            <label>option Image <span class="error">*</span></label>
                                                <input type="file" name="image" id="image" / >

                                        </div>
                                                                                <div class="form-group">

                                            <label>description <span class="error">*</span></label>

																						<textarea rows="20" cols="70" class="ckeditor" id="description" name="description" ></textarea>
                                        </div>
                                         <div class="form-group">

                                        <input type="submit" name="submit" value="Submit" class="btn btn-primary">

                                        </div>

                                   </form>

                                </div>

                                <!-- /.col-lg-6 (nested) -->

                                

                                <!-- /.col-lg-6 (nested) -->

                            </div>

                            <!-- /.row (nested) -->

                        </div>

                        <!-- /.panel-body -->

                    </div>

                    <!-- /.panel -->

                </div>

                <!-- /.col-lg-12 -->

            </div>

            <!-- /.row -->

        </div>

</div>

 <?php include('footer.php');?> 