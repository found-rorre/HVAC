<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Insert title here</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="<%= request.getContextPath()%>/img/favicon.ico" />
	<!-- Custom styles for this template -->
    <link href="<%= request.getContextPath()%>/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%= request.getContextPath()%>/css/sb-admin-2.min.css" rel="stylesheet">
    
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/styles.css"/>
    
    <script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.7.0.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
	
	<style type="text/css">
	
	.arrow_btn {
		cursor: pointer;
	}
	
	.arrow_btn:hover {
		text-shadow: 1px 1px 3px #333333;
	}
	
	</style>
	
</head>	
<body id="page-top">
    <div class="d-flex" id="wrapper">
		<!-- Sidebar-->
       	<div class="border-end bg-white" id="sidebar-wrapper">
            <jsp:include page="/WEB-INF/views/layout/side.jsp"/>      
				<!-- ^ 해당부분에 토글하던 어캐하던 디자인 합의필요 -->
        </div>
    	<!-- Page content wrapper-->
        <div id="page-content-wrapper">
            <!-- Top navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
            	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
            </nav>
	        <!-- Content Wrapper -->
	        <div id="content-wrapper" class="d-flex flex-column">
	
	            <!-- Main Content -->
	            <div id="content">
	                <!-- Begin Page Content -->
					<div class="container-fluid">
	
	                    <!-- Page Heading -->
	                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
	                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
	                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
	                                class="fas fa-download fa-sm text-white-50"></i> 보고서 다운로드</a>
	                    </div>

<!-- 상단 4 -->
	                    <div class="row mb-4">
							<!-- YearlyIncome -->
	                        <div class="col-xl-3 col-md-6">
	                            <div class="card border-left-success shadow h-100 py-2">
	                                <div class="card-body d-flex justify-content-between align-items-end">
										<div>
										    <i class="bi bi-chevron-left fa-2x text-gray-300 arrow_btn"></i>
										</div>
										<div class="text-center">
											<span class="text-xs text-success mb-1">
												<span id="year_name" class="date"></span>(년별)
											</span>
										    <h5 id="yearlyIncome"></h5>
										</div>
										<div>
										    <i class="bi bi-chevron-right fa-2x text-gray-300 arrow_btn"></i>
										</div>
	                                </div>
	                            </div>
	                        </div>
	                        
	                        <!-- MonthlyIncome -->
	                        <div class="col-xl-3 col-md-6">
	                            <div class="card border-left-primary shadow h-100 py-2">
	                                <div class="card-body d-flex justify-content-between align-items-end">
	                            		<div>
										    <i class="bi bi-chevron-left fa-2x text-gray-300 arrow_btn"></i>
										</div>
										<div class="text-center">
												<span class="text-xs text-primary mb-1">
												<span id="month_name" class="date"></span>(월별)
											</span>
										    <h5 id="monthlyIncome"></h5>
										</div>
										<div>
										    <i class="bi bi-chevron-right fa-2x text-gray-300 arrow_btn"></i>
										</div>
	                                </div>
	                            </div>
	                        </div>
	
	 
	
	                        <!-- Earnings (Monthly) Card Example -->
	                        <div class="col-xl-3 col-md-6">
	                            <div class="card border-left-info shadow h-100 py-2">
	                                <div class="card-body">
	                                    <div class="row no-gutters align-items-center">
	                                        <div class="col mr-2">
	                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">작업
	                                            </div>
	                                            <div class="row no-gutters align-items-center">
	                                                <div class="col-auto">
	                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
	                                                </div>
	                                                <div class="col">
	                                                    <div class="progress progress-sm mr-2">
	                                                        <div class="progress-bar bg-info" role="progressbar"
	                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
	                                                            aria-valuemax="100"></div>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <div class="col-auto">
	                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	
	                        <!-- Pending Requests Card Example -->
	                        <div class="col-xl-3 col-md-6">
	                            <div class="card border-left-warning shadow h-100 py-2">
	                                <div class="card-body d-flex justify-content-between">
										<div class="text-center">
										    <span class="text-xs text-warning mb-1">보류 중인 요청</span>
										    <h5 id="question_input"></h5>
										</div>
										<div class="align-self-end">
										    <i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
		                            </div>
		                        </div>
	                        </div>
	                        
	                    </div>
					<!-- 상단 4 끝 -->

	                    <div class="row">
	
	                        <!-- Area Chart -->
	                        <div class="col-xl-8 col-lg-7">
	                            <div class="card shadow mb-4">
	                                <!-- Card Header - Dropdown -->
	                                <div
	                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
	                                    <h6 class="m-0 font-weight-bold text-primary">연 매출 그래프</h6>
	                                    <div class="dropdown no-arrow">
	                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
	                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
	                                        </a>
	                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
	                                            aria-labelledby="dropdownMenuLink">
	                                            <div class="dropdown-header">Dropdown Header:</div>
	                                            <a class="dropdown-item" href="#">Action</a>
	                                            <a class="dropdown-item" href="#">Another action</a>
	                                            <div class="dropdown-divider"></div>
	                                            <a class="dropdown-item" href="#">Something else here</a>
	                                        </div>
	                                    </div>
	                                </div>
	                                <!-- Card Body -->
	                                <div class="card-body">
	                                    <div class="chart-area">
	                                        <canvas id="myAreaChart"></canvas>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	
	                        <!-- Pie Chart -->
							<div class="col-xl-4 col-lg-5">
								<div class="card shadow mb-4">
									<!-- Card Header - Dropdown -->
									<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">차량 상태</h6>
									</div>
									<!-- Card Body -->
									<div class="card-body">
										<div class="chart-pie pt-4 pb-2">
											<canvas id="chart_car"></canvas>
										</div>
										<div class="mt-4 text-center small">
											<span class="mr-2">
												<i class="fas fa-circle" style="color: #4e73df"></i> 입고
											</span>
											<span class="mr-2">
												<i class="fas fa-circle" style="color: #FFB266"></i> 출고
											</span>
											<span class="mr-2">
												<i class="fas fa-circle" style="color: #1cc88a"></i> 정비
											</span>
										</div>
									 </div>
								 </div>
							</div>
							
	                    </div>

                    <!-- Content Row -->
	                    <div class="row">
		
	                        <!-- Content Column -->
	                        <div class="col-lg-6 mb-4">
	
	                            <!-- Project Card Example -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
	                                </div>
	                                <div class="card-body">
	                                    <h4 class="small font-weight-bold">Server Migration <span
	                                            class="float-right">20%</span></h4>
	                                    <div class="progress mb-4">
	                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
	                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
	                                    </div>
	                                    <h4 class="small font-weight-bold">Sales Tracking <span
	                                            class="float-right">40%</span></h4>
	                                    <div class="progress mb-4">
	                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
	                                            aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
	                                    </div>
	                                    <h4 class="small font-weight-bold">Customer Database <span
	                                            class="float-right">60%</span></h4>
	                                    <div class="progress mb-4">
	                                        <div class="progress-bar" role="progressbar" style="width: 60%"
	                                            aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
	                                    </div>
	                                    <h4 class="small font-weight-bold">Payout Details <span
	                                            class="float-right">80%</span></h4>
	                                    <div class="progress mb-4">
	                                        <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
	                                            aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
	                                    </div>
	                                    <h4 class="small font-weight-bold">Account Setup <span
	                                            class="float-right">Complete!</span></h4>
	                                    <div class="progress">
	                                        <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
	                                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        
						
	                        <div class="col-lg-6 mb-4">
	                            <!-- Approach -->
	                            <div class="card shadow mb-4">
	                                <div class="card-header py-3">
	                                    <h6 class="m-0 font-weight-bold text-primary">소개글 예시</h6>
	                                </div>
	                                <div class="card-body">
	                                
		                                <p>
											올해 회사의 성과를 시각적으로 파악하기 위해 우리는 다양한 차트와 그래프를 사용하고 있습니다. 
											이러한 차트는 주요 지표와 데이터를 더 잘 이해하고 전달하기 위한 강력한 도구입니다.
										</p>
											
										<p>
											예를 들어, 월별 매출을 보여주는 선 그래프는 우리의 매출 추이를 한눈에 파악할 수 있도록 도와줍니다. 
											이 그래프는 전년도와 비교하여 성장 경향을 확인하는 데도 유용합니다. 또한 부서 간 비용을 비교하는 파이 차트를 통해 어떤 부서가 가장 비용이 많이 드는지를 시각적으로 확인할 수 있습니다.
										</p>
											
										<p>
											또한 프로젝트 진행 상황을 추적하기 위해 간트 차트를 사용하고 있습니다. 
											이 차트는 프로젝트 일정과 작업의 진행 상황을 한눈에 확인할 수 있도록 도와줍니다. 
											특히 어떤 작업이 지연되고 있는지를 파악하여 대응 조치를 취할 때 유용합니다.
										</p>
											
										<p>
											이러한 차트와 그래프를 통해 우리는 데이터를 더 효과적으로 활용하고 의사 결정에 도움을 줄 수 있습니다. 
											차트를 통해 복잡한 정보를 간단하고 명확하게 전달할 수 있어 팀 전체의 업무 효율성을 향상시키고 있습니다.
										</p>
	                                </div>
								</div>
							</div>
						</div>  
					</div>
				<!-- row 끝 -->
				</div>
			</div>
		</div>
	</div>
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="<%= request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
<script src="<%= request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="<%= request.getContextPath()%>/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="<%= request.getContextPath()%>/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="<%= request.getContextPath()%>/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="<%= request.getContextPath()%>/js/demo/chart-area.js" defer></script>
<script src="<%= request.getContextPath()%>/js/demo/chart-pie.js" defer></script>
<script src="<%= request.getContextPath()%>/js/adminMain.js" defer></script>

</body>
</html>