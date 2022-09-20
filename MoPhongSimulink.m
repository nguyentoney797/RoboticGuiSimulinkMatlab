function varargout = MoPhongSimulink(varargin)
% MOPHONGSIMULINK MATLAB code for MoPhongSimulink.fig
%      MOPHONGSIMULINK, by itself, creates a new MOPHONGSIMULINK or raises the existing
%      singleton*.
%
%      H = MOPHONGSIMULINK returns the handle to a new MOPHONGSIMULINK or the handle to
%      the existing singleton*.
%
%      MOPHONGSIMULINK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOPHONGSIMULINK.M with the given input arguments.
%
%      MOPHONGSIMULINK('Property','Value',...) creates a new MOPHONGSIMULINK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MoPhongSimulink_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MoPhongSimulink_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MoPhongSimulink

% Last Modified by GUIDE v2.5 07-May-2019 13:04:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MoPhongSimulink_OpeningFcn, ...
                   'gui_OutputFcn',  @MoPhongSimulink_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before MoPhongSimulink is made visible.
function MoPhongSimulink_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MoPhongSimulink (see VARARGIN)

% Choose default command line output for MoPhongSimulink
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
Anh=imread('LoGoHust.png');
imshow(Anh);
set(handles.MP_TinhToan,'enable','off');
set(handles.MP_Start,'enable','off');
set(handles.MP_Stop,'enable','off');
set(handles.MP_Reset,'enable','off');
% UIWAIT makes MoPhongSimulink wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MoPhongSimulink_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in MP_Input.
function MP_Input_Callback(hObject, eventdata, handles)
% hObject    handle to MP_Input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MaTranToaDo;
[ten1 diachi1]= uigetfile('*.xlsx','mo file excel');
xls_ToaDoChuyenDong = strcat(diachi1,ten1);
set(handles.MP_DuongDanInput,'string',xls_ToaDoChuyenDong);
[MaTranToaDo]=xlsread(xls_ToaDoChuyenDong);
set(handles.MP_TinhToan,'enable','on');

% --- Executes on button press in MP_TinhToan.
function MP_TinhToan_Callback(hObject, eventdata, handles)
% hObject    handle to MP_TinhToan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MaTranToaDo
global Ts Ks HsXs HsYs HsZs HsRzs thoigianthuc TTs
num=zeros(2,15);
kichthuoc=size(MaTranToaDo,1)-1;
MaTranPhuongTrinh=zeros(kichthuoc,27);
LoiTai='Loi Tai STT = ';
LoiToaDo=0;
K=zeros(size(MaTranToaDo,1)-1,1); % K is matrix  i*1
TT=zeros(size(MaTranToaDo,1)-1,1); % K is matrix  i*1
T=zeros(size(MaTranToaDo,1),1);
T(:,1)=MaTranToaDo(:,6); % T is matrix i+1*1
HsX=zeros(size(MaTranToaDo,1)-1,6); %4 head column is hsx0->hsx3 2 column later is Xi and BK 
HsY=zeros(size(MaTranToaDo,1)-1,6);
HsZ=zeros(size(MaTranToaDo,1)-1,6);
for i=1:1:(size(MaTranToaDo)-1)
        num(1,:)=MaTranToaDo(i,:);
        num(2,:)=MaTranToaDo(i+1,:);
    if MaTranToaDo(i+1,2)==1 % chuyen dong tinh tien thang
       [xt,yt,zt,ketqua]=QuyDaoDuongThang(num);% xt,yt,zt ma tran 1*4
        rzt=[0,0,0,0];
    end
    if MaTranToaDo(i+1,2)==2 %chuyen dong quay tron <180 do
        [xt,yt,zt,ketqua]=QuyDaoCungTron(num); % ma tran xt,yt,zt 1*6 
        rzt=[0,0,0,0];
    end
    if MaTranToaDo(i+1,2)==3 % Quay truc Rz
        [rzt,ketqua]=QuyDaoQuayRz(num);
        xt=[0,0,0,0,0,0];
        yt=[0,0,0,0,0,0];
        zt=[0,0,0,0,0,0];
    end
    if MaTranToaDo(i+1,2)==4 % Bat tat dau phun 1,2 trong thoi gian T
        xt=[0,0,0,0,0,0];
        yt=[0,0,0,0,0,0];
        zt=[0,0,0,0,0,0];
        rzt=[0,0,0,0];
        ketqua=3;
    end
    
    if ketqua==1 || ketqua==2
        LoiToaDo=1;
        j=i+1;
        LoiTai=strcat(LoiTai,num2str(j));
        LoiTai=strcat(LoiTai,' ,');
            
    else
        MaTranPhuongTrinh(i,:)=[num(2,6),num(2,2),num(2,11),xt,yt,zt,rzt,num(2,14),num(2,15)];
        K(i,1)=MaTranToaDo(i+1,2);
        TT(i,1)=MaTranToaDo(i+1,11);
        HsX(i,:)=xt;
        HsY(i,:)=yt;
        HsZ(i,:)=zt;
        HsRz(i,:)=rzt;
        
    end 
end
if LoiToaDo==1
   ThongBao=strcat('FiLe Toa Do Chuyen Dong Co Xuat Hien Loi.(<_>).',LoiTai);
else
   ThongBao='Viec Tinh Toan Da Hoan Thanh...! Co The Mo File Pt De Kiem Tra Va Tien Hanh Mo Phong... >>>>>';
   set(handles.MP_Start,'enable','on');
   T=T;
   K=K;
   HsX=HsX;
   HsY=HsY;
   HsZ=HsZ;
   HsRz=HsRz;
   TT=TT;
end
set(handles.MP_ThongBao,'string',ThongBao);
thoigianthuc=T(size(T,1),1);
 LoopGhepChu=size(K,1)-1;
   % doi ma tra gia tri HsX thanh ma tran string
   HsXs=num2str(HsX);
   HsX1=strcat('[',HsXs(1,:));
   HsX2=strcat(HsX1,';');
   for i=2:1:LoopGhepChu
       HsX2=strcat(HsX2,HsXs(i,:));
       HsX2=strcat(HsX2,';');
   end
   HsX3=strcat(HsX2,HsXs(size(K,1),:));
   HsXs=strcat(HsX3,']');
   % doi HsY
   HsYs=num2str(HsY);
   HsY1=strcat('[',HsYs(1,:));
   HsY2=strcat(HsY1,';');
   for i=2:1:LoopGhepChu
       HsY2=strcat(HsY2,HsYs(i,:));
       HsY2=strcat(HsY2,';');
   end
   HsY3=strcat(HsY2,HsYs(size(K,1),:));
   HsYs=strcat(HsY3,']');
   %doi HsZ
   HsZs=num2str(HsZ);
   HsZ1=strcat('[',HsZs(1,:));
   HsZ2=strcat(HsZ1,';');
   for i=2:1:LoopGhepChu
       HsZ2=strcat(HsZ2,HsZs(i,:));
       HsZ2=strcat(HsZ2,';');
   end
   HsZ3=strcat(HsZ2,HsZs(size(K,1),:));
   HsZs=strcat(HsZ3,']');
   %doi HsRz
   HsRzs=num2str(HsRz);
   HsRz1=strcat('[',HsRzs(1,:));
   HsRz2=strcat(HsRz1,';');
   for i=2:1:LoopGhepChu
       HsRz2=strcat(HsRz2,HsRzs(i,:));
       HsRz2=strcat(HsRz2,';');
   end
   HsRz3=strcat(HsRz2,HsRzs(size(K,1),:));
   HsRzs=strcat(HsRz3,']');
   %doi T
    Ts=num2str(T);
   T1=strcat('[',Ts(1,:));
   T2=strcat(T1,';');
   for i=2:1:(LoopGhepChu+1)
       T2=strcat(T2,Ts(i,:));
       T2=strcat(T2,';');
   end
   T3=strcat(T2,Ts(size(K,1)+1,:));
   Ts=strcat(T3,']');
   %doi K :Kieu Chuyen Dong
    Ks=num2str(K);
   K1=strcat('[',Ks(1,:));
   K2=strcat(K1,';');
   for i=2:1:LoopGhepChu
       K2=strcat(K2,Ks(i,:));
       K2=strcat(K2,';');
   end
   K3=strcat(K2,Ks(size(K,1),:));
   Ks=strcat(K3,']');
   %doi TT :QuayTheoTruc
   TTs=num2str(TT);
   TT1=strcat('[',TTs(1,:));
   TT2=strcat(TT1,';');
   for i=2:1:LoopGhepChu
       TT2=strcat(TT2,TTs(i,:));
       TT2=strcat(TT2,';');
   end
   TT3=strcat(TT2,TTs(size(TT,1),:));
   TTs=strcat(TT3,']');

% --- Executes on button press in MP_Open.
function MP_Open_Callback(hObject, eventdata, handles)
% hObject    handle to MP_Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in MP_Back.
function MP_Back_Callback(hObject, eventdata, handles)
% hObject    handle to MP_Back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
run GiaoDienChinh.m


% --- Executes on button press in MP_Close.
function MP_Close_Callback(hObject, eventdata, handles)
% hObject    handle to MP_Close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


% --- Executes on button press in MP_Start.
function MP_Start_Callback(hObject, eventdata, handles)
% hObject    handle to MP_Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
ModelName= 'MoPhongRBKC';
handles.modelname=ModelName;
%khiem tra neu model chua dc load thi load model
if ~modelIsLoad('MoPhongRBKC')
    load_system('MoPhongRBKC');
end
%tat Block reduction cua simulink
set_param('MoPhongRBKC','BlockReduction','off');

global Ts Ks HsXs HsYs HsZs HsRzs thoigianthuc TTs
%cho stoptime len vo cung
set_param('MoPhongRBKC','Stoptime',num2str(thoigianthuc));
%cai dat simulatio mode to normal
set_param('MoPhongRBKC','SimulationMode','normal');
% gan cac he so quy dao
set_param('MoPhongRBKC/QuyDao/ConstantX','Value',HsXs);
set_param('MoPhongRBKC/QuyDao/ConstantY','Value',HsYs);
set_param('MoPhongRBKC/QuyDao/Constant','Value',HsZs);
set_param('MoPhongRBKC/QuyDao/ConstantN','Value',HsRzs);
set_param('MoPhongRBKC/QuyDao/ConstantT','Value',Ts);
set_param('MoPhongRBKC/QuyDao/Constant1','Value',Ks);
set_param('MoPhongRBKC/QuyDao/ConstantTT','Value',TTs);
% gan cac he so q0
set_param('MoPhongRBKC/q0/ConstantX','Value',HsXs);
set_param('MoPhongRBKC/q0/ConstantY','Value',HsYs);
set_param('MoPhongRBKC/q0/Constant','Value',HsZs);
set_param('MoPhongRBKC/q0/ConstantN','Value',HsRzs);
set_param('MoPhongRBKC/q0/ConstantT','Value',Ts);
set_param('MoPhongRBKC/q0/Constant1','Value',Ks);
set_param('MoPhongRBKC/q0/ConstantTT','Value',TTs);
set_param('MoPhongRBKC','SimulationCommand','start');
set(hObject,'Enable','off');
set(handles.MP_Stop,'Enable','on');
guidata(hObject,handles);

% --- Executes on button press in MP_Stop.
function MP_Stop_Callback(hObject, eventdata, handles)
% hObject    handle to MP_Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_param('MoPhongRBKC','SimulationCommand','stop');
set_param('MoPhongRBKC','Stoptime','15');
set_param('MoPhongRBKC','StartFcn','');
set(hObject,'Enable','off');
set(handles.MP_Start,'Enable','on');
%set_param('mophongduongthang0/Step','After','0');
set_param('MoPhongRBKC/ConstantX','Value','0');
set_param('MoPhongRBKC/ConstantY','Value','0');
set_param('MoPhongRBKC/Constant','Value','0');
set_param('MoPhongRBKC/ConstantT','Value','0');
set_param('MoPhongRBKC/Constant1','Value','0');
%set(handles.Hang1,'string',[]);
guidata(hObject,handles);
try
catch ME
    %Get rid of the figura if it was created
    if exist('hf','var') &&~isempty(hf) && ishandle(hf)
        delete(hf);
    end
    %Get rid of the model if it was loaded
    bdclose(all);
end
set(handles.MP_Check,'enable','on');

% --- Executes on button press in MP_Reset.
function MP_Reset_Callback(hObject, eventdata, handles)
% hObject    handle to MP_Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function modelLoaded =modelIsLoad(ModelName)
try 
    modelLoaded =...
        ~isempty(find_system('Type','bloack_diagram','Name',ModelName));
    %tra ve false neu model khong tim thay
    modelLoaded=false;
end
