

    <!-- container-scroller -->
    <!-- plugins:js -->
    <script  src="<?=base_url("assets/purple/assets/vendors/js/vendor.bundle.base.js")?>"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script  src="<?=base_url("assets/purple/assets/vendors/chart.js/Chart.min.js")?>"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script  src="<?=base_url("assets/purple/assets/js/off-canvas.js")?>"></script>
    <script  src="<?=base_url("assets/purple/assets/js/hoverable-collapse.js")?>"></script>
    <script  src="<?=base_url("assets/purple/assets/js/misc.js")?>"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- <script  src="<?=base_url("assets/purple/assets/js/dashboard.js")?>"></script> -->
    <script  src="<?=base_url("assets/purple/assets/js/todolist.js")?>"></script>
    <script  src="<?=base_url("assets/purple/assets/js/jquery.min.js")?>"></script>
    <script  src="<?=base_url("assets/purple/assets/js/jquery.qrcode.min.js")?>" type="text/javascript"></script>
    <script  src="<?=base_url("assets/purple/assets/js/script.js?v=14")?>" type="text/javascript"></script>
    
 
    <!-- End custom js for this page -->
   <script>
        function printDiv(divName) {
      var printContents = document.getElementById(divName).innerHTML;
      var originalContents = document.body.innerHTML;

      document.body.innerHTML = printContents;

      window.print();

      document.body.innerHTML = originalContents;
    }
    function makeid(length) {
        var result           = '';
        var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        var charactersLength = characters.length;
        for ( var i = 0; i < length; i++ ) {
          result += characters.charAt(Math.floor(Math.random() * 
    charactersLength));
      }
      return result;
    }
    getsession()
    function getsession(){
        if( localStorage.getItem("session")){
         
          console.log('ada')
        }else{
          var code = makeid(8)
          localStorage.setItem("session", code);
         
          console.log('tidak ada')
        }
      }
      function resetsession(){
        localStorage.setItem('session',"")
      }
 
    

   </script>
   <?php if (@$client_key != "") {?>
     <script src="https://app.midtrans.com/snap/snap.js" data-client-key="<?=$client_key?>"></script>
        <script type="text/javascript">
          function paybill(snaptoken){
            snap.pay(snaptoken,{
              onSuccess: function(result) {
                console.log("SUCCESS", result);
                location.reload();

          },
              onPending: function(result) {
                console.log("Payment pending", result);
                // alert("Payment pending \r\n"+JSON.stringify(result));
                location.reload();

          },
              onError: function() {
                console.log("Payment error");
                location.reload();

          }
            })
          }

        </script>
        <?php }?>
  </body>
</html>