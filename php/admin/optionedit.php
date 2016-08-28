<?php

include('header.php');

if(isset($_GET['id']))

{

    $id=base64_decode($_GET['id']);

    $option=$optObj->getOptionById($id);

}

else

{

    header("location:optionlist.php");

}

$updateArray=array();

$errMsg="";$succMsg="";$err=0;



    $updateArray['optionname']=isset($_POST['name'])?cleanInputField($_POST['name']):$option[0]['optionname'];

    $updateArray['optionPrice']=isset($_POST['price'])?cleanInputField($_POST['price']):$option[0]['optionPrice'];

    $updateArray['productImage']=isset($_POST['productImage'])?cleanInputField($_POST['productImage']):$option[0]['productImage'];

    $updateArray['description']=isset($_POST['description'])?cleanInputField($_POST['description']):$option[0]['description'];

if(isset($_POST['submit']))

{

    $image = isset($_FILES['image']['name'])?cleanInputField($_FILES['image']['name']):'';
    
    if($updateArray['optionname']==""){

        $errMsg="Please enter all mandatory fields";

    }
    
    if ($image) {
        
        $type= $_FILES['image']['type'];

        $ext = strtolower(substr(strrchr($_FILES['image']['name'], "."), 1));

        $updateArray['productImage']="prod_".date('dmyhis').$_FILES['image']['name'];

        $move=move_uploaded_file ($_FILES['image']['tmp_name'],'../public/uploads/products/'.$updateArray['productImage']);

        if($move=="")

        {
            echo 'error';
            $err=1;

            $errMsg="Failed to upload image";
        }
    }

    else

    {

        $ins=$optObj->updateOptionById($updateArray,$id);

        $succMsg="Data updated successfully";

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

                           Edit Option

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

                                            <input class="form-control" name="name" id="name" value="<?php echo $updateArray['optionname'];?>">

                                        </div>

                                        <div class="form-group">

                                            <label>Price <span class="error">*</span></label>

                                            <input class="form-control" name="price" id="price" value="<?php echo $updateArray['optionPrice'];?>">

                                        </div>


                                        <div class="form-group">

                                            <label>Image <span class="error">*</span></label>

                                                 <img src="../public/uploads/products/<?php echo $updateArray['productImage'];?>" width="100" height="100">

                                                 <br>

                                                 <input type="file" name="image" id="image" / >

                                        </div>

                                        <div class="form-group">

                                            <label>description <span class="error">*</span></label>

                                            <textarea id="description"  name="description"  > <?php echo $updateArray['description'];?></textarea>

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

  

  