function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 11-Dec-2017 00:51:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in recordbutton1.
function recordbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to recordbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.edittext1.String = '';
handles.edittext2.String = '';
handles.edittext3.String = '';
handles.edittext4.String = '';
handles.edittext5.String = '';
handles.edittext6.String = '';


set(handles.recordbutton1,'string','Recording','BackgroundColor','red');

Fs =44100;
recObj = audiorecorder(Fs, 16, 2);
recordblocking(recObj, 10);
handles.recordbutton1.String = 'Searching...' ;
handles.recordbutton1.BackgroundColor = 'blue';
handles.edittext1.String = 'Searching...';
recorded = getaudiodata(recObj);
set(handles.recordbutton1,'string','Searching...','BackgroundColor','blue','enable','off');
handles.edittext1.String = 'Searching...';
recorded1 = recorded(:,1);
set(handles.recordbutton1,'string','Searching...','BackgroundColor','blue','enable','off');
handles.edittext1.String = 'Searching...';
recordMap = MapRecord(recorded1);

set(handles.recordbutton1,'string','Searching...','BackgroundColor','blue','enable','off');
handles.edittext1.String = 'Searching...';

[name,how,where] = MatchSong(recordMap);


handles.edittext1.String = name(1).title;
handles.edittext2.String = name(2).title;
handles.edittext3.String = name(3).title;
handles.edittext4.String = how(1);
handles.edittext5.String = how(2);
handles.edittext6.String = how(3);


set(handles.recordbutton1,'string','RECORD','BackgroundColor','green','enable','on');

function edittext1_Callback(hObject, eventdata, handles)
% hObject    handle to edittext1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edittext1 as text
%        str2double(get(hObject,'String')) returns contents of edittext1 as a double


% --- Executes during object creation, after setting all properties.
function edittext1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edittext1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edittext2_Callback(hObject, eventdata, handles)
% hObject    handle to edittext2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edittext2 as text
%        str2double(get(hObject,'String')) returns contents of edittext2 as a double


% --- Executes during object creation, after setting all properties.
function edittext2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edittext2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edittext3_Callback(hObject, eventdata, handles)
% hObject    handle to edittext3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edittext3 as text
%        str2double(get(hObject,'String')) returns contents of edittext3 as a double


% --- Executes during object creation, after setting all properties.
function edittext3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edittext3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edittext4_Callback(hObject, eventdata, handles)
% hObject    handle to edittext4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edittext4 as text
%        str2double(get(hObject,'String')) returns contents of edittext4 as a double


% --- Executes during object creation, after setting all properties.
function edittext4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edittext4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edittext5_Callback(hObject, eventdata, handles)
% hObject    handle to edittext5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edittext5 as text
%        str2double(get(hObject,'String')) returns contents of edittext5 as a double


% --- Executes during object creation, after setting all properties.
function edittext5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edittext5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edittext6_Callback(hObject, eventdata, handles)
% hObject    handle to edittext6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edittext6 as text
%        str2double(get(hObject,'String')) returns contents of edittext6 as a double


% --- Executes during object creation, after setting all properties.
function edittext6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edittext6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eittext10_Callback(hObject, eventdata, handles)
% hObject    handle to eittext10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eittext10 as text
%        str2double(get(hObject,'String')) returns contents of eittext10 as a double


% --- Executes during object creation, after setting all properties.
function eittext10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eittext10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edittext11_Callback(hObject, eventdata, handles)
% hObject    handle to edittext11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edittext11 as text
%        str2double(get(hObject,'String')) returns contents of edittext11 as a double


% --- Executes during object creation, after setting all properties.
function edittext11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edittext11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
