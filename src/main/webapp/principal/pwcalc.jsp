<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">


<jsp:include page="head.jsp"></jsp:include>

<body>
	<!-- Pre-loader start -->

	<jsp:include page="theme-loader.jsp"></jsp:include>

	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">

					<jsp:include page="navbarmainmenu.jsp"></jsp:include>

					<div class="pcoded-content">
						<!-- Page-header start -->
						<jsp:include page="page-header.jsp"></jsp:include>
						<!-- Page-header end -->
										<div class="embed-responsive embed-responsive-16by9" style="height:100%;">
											<iframe class="embed-responsive-item"
												src=https://www.mypers.pw/19/></iframe>
										</div>
									<!-- Page-body end -->
								<div id="styleSelector"></div>
						</div>
					</div>
				</div>
			</div>
		</div>


	<jsp:include page="javascriptfile.jsp"></jsp:include>
</body>

</html>