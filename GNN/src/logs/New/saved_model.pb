??	
??
D
AddV2
x"T
y"T
z"T"
Ttype:
2	??
B
AssignVariableOp
resource
value"dtype"
dtypetype?
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
N
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype"
Truncatebool( 
8
Const
output"dtype"
valuetensor"
dtypetype
;
Elu
features"T
activations"T"
Ttype:
2
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(?

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype?
@
RealDiv
x"T
y"T
z"T"
Ttype:
2	
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0?
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
?
SparseTensorDenseMatMul
	a_indices"Tindices
a_values"T
a_shape	
b"T
product"T"	
Ttype"
Tindicestype0	:
2	"
	adjoint_abool( "
	adjoint_bbool( 
?
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ??
@
StaticRegexFullMatch	
input

output
"
patternstring
?
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
?
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 ?"serve*2.7.12v2.7.0-217-g2a0f59ecfe68??
?
net/cheb_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_namenet/cheb_conv/kernel
?
(net/cheb_conv/kernel/Read/ReadVariableOpReadVariableOpnet/cheb_conv/kernel*"
_output_shapes
: *
dtype0
|
net/cheb_conv/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_namenet/cheb_conv/bias
u
&net/cheb_conv/bias/Read/ReadVariableOpReadVariableOpnet/cheb_conv/bias*
_output_shapes
: *
dtype0
~
net/dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
?2?*!
shared_namenet/dense/kernel
w
$net/dense/kernel/Read/ReadVariableOpReadVariableOpnet/dense/kernel* 
_output_shapes
:
?2?*
dtype0
u
net/dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*
shared_namenet/dense/bias
n
"net/dense/bias/Read/ReadVariableOpReadVariableOpnet/dense/bias*
_output_shapes	
:?*
dtype0
?
net/dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??*#
shared_namenet/dense_1/kernel
{
&net/dense_1/kernel/Read/ReadVariableOpReadVariableOpnet/dense_1/kernel* 
_output_shapes
:
??*
dtype0
y
net/dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*!
shared_namenet/dense_1/bias
r
$net/dense_1/bias/Read/ReadVariableOpReadVariableOpnet/dense_1/bias*
_output_shapes	
:?*
dtype0
?
net/dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??*#
shared_namenet/dense_2/kernel
{
&net/dense_2/kernel/Read/ReadVariableOpReadVariableOpnet/dense_2/kernel* 
_output_shapes
:
??*
dtype0
y
net/dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*!
shared_namenet/dense_2/bias
r
$net/dense_2/bias/Read/ReadVariableOpReadVariableOpnet/dense_2/bias*
_output_shapes	
:?*
dtype0
?
net/dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?*#
shared_namenet/dense_3/kernel
z
&net/dense_3/kernel/Read/ReadVariableOpReadVariableOpnet/dense_3/kernel*
_output_shapes
:	?*
dtype0
x
net/dense_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*!
shared_namenet/dense_3/bias
q
$net/dense_3/bias/Read/ReadVariableOpReadVariableOpnet/dense_3/bias*
_output_shapes
:*
dtype0

NoOpNoOp
?
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*?
value?B? B?
?
conv
dropout
flatten

dense1

dense2

dense3

dense4
	variables
	trainable_variables

regularization_losses
	keras_api

signatures
y
kwargs_keys

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
R
	variables
trainable_variables
regularization_losses
	keras_api
R
	variables
trainable_variables
regularization_losses
	keras_api
h

kernel
bias
	variables
trainable_variables
 regularization_losses
!	keras_api
h

"kernel
#bias
$	variables
%trainable_variables
&regularization_losses
'	keras_api
h

(kernel
)bias
*	variables
+trainable_variables
,regularization_losses
-	keras_api
h

.kernel
/bias
0	variables
1trainable_variables
2regularization_losses
3	keras_api
F
0
1
2
3
"4
#5
(6
)7
.8
/9
F
0
1
2
3
"4
#5
(6
)7
.8
/9
 
?
4non_trainable_variables

5layers
6metrics
7layer_regularization_losses
8layer_metrics
	variables
	trainable_variables

regularization_losses
 
 
PN
VARIABLE_VALUEnet/cheb_conv/kernel&conv/kernel/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEnet/cheb_conv/bias$conv/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1

0
1
 
?
9non_trainable_variables

:layers
;metrics
<layer_regularization_losses
=layer_metrics
	variables
trainable_variables
regularization_losses
 
 
 
?
>non_trainable_variables

?layers
@metrics
Alayer_regularization_losses
Blayer_metrics
	variables
trainable_variables
regularization_losses
 
 
 
?
Cnon_trainable_variables

Dlayers
Emetrics
Flayer_regularization_losses
Glayer_metrics
	variables
trainable_variables
regularization_losses
NL
VARIABLE_VALUEnet/dense/kernel(dense1/kernel/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUEnet/dense/bias&dense1/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1

0
1
 
?
Hnon_trainable_variables

Ilayers
Jmetrics
Klayer_regularization_losses
Llayer_metrics
	variables
trainable_variables
 regularization_losses
PN
VARIABLE_VALUEnet/dense_1/kernel(dense2/kernel/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEnet/dense_1/bias&dense2/bias/.ATTRIBUTES/VARIABLE_VALUE

"0
#1

"0
#1
 
?
Mnon_trainable_variables

Nlayers
Ometrics
Player_regularization_losses
Qlayer_metrics
$	variables
%trainable_variables
&regularization_losses
PN
VARIABLE_VALUEnet/dense_2/kernel(dense3/kernel/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEnet/dense_2/bias&dense3/bias/.ATTRIBUTES/VARIABLE_VALUE

(0
)1

(0
)1
 
?
Rnon_trainable_variables

Slayers
Tmetrics
Ulayer_regularization_losses
Vlayer_metrics
*	variables
+trainable_variables
,regularization_losses
PN
VARIABLE_VALUEnet/dense_3/kernel(dense4/kernel/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEnet/dense_3/bias&dense4/bias/.ATTRIBUTES/VARIABLE_VALUE

.0
/1

.0
/1
 
?
Wnon_trainable_variables

Xlayers
Ymetrics
Zlayer_regularization_losses
[layer_metrics
0	variables
1trainable_variables
2regularization_losses
 
1
0
1
2
3
4
5
6
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
y
serving_default_args_0Placeholder*'
_output_shapes
:?????????*
dtype0*
shape:?????????
{
serving_default_args_0_1Placeholder*'
_output_shapes
:?????????*
dtype0	*
shape:?????????
s
serving_default_args_0_2Placeholder*#
_output_shapes
:?????????*
dtype0*
shape:?????????
a
serving_default_args_0_3Placeholder*
_output_shapes
:*
dtype0	*
shape:
s
serving_default_args_0_4Placeholder*#
_output_shapes
:?????????*
dtype0	*
shape:?????????
?
StatefulPartitionedCallStatefulPartitionedCallserving_default_args_0serving_default_args_0_1serving_default_args_0_2serving_default_args_0_3serving_default_args_0_4net/cheb_conv/kernelnet/cheb_conv/biasnet/dense/kernelnet/dense/biasnet/dense_1/kernelnet/dense_1/biasnet/dense_2/kernelnet/dense_2/biasnet/dense_3/kernelnet/dense_3/bias*
Tin
2			*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*,
_read_only_resource_inputs

	
*0
config_proto 

CPU

GPU2*0J 8? *-
f(R&
$__inference_signature_wrapper_448943
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
?
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename(net/cheb_conv/kernel/Read/ReadVariableOp&net/cheb_conv/bias/Read/ReadVariableOp$net/dense/kernel/Read/ReadVariableOp"net/dense/bias/Read/ReadVariableOp&net/dense_1/kernel/Read/ReadVariableOp$net/dense_1/bias/Read/ReadVariableOp&net/dense_2/kernel/Read/ReadVariableOp$net/dense_2/bias/Read/ReadVariableOp&net/dense_3/kernel/Read/ReadVariableOp$net/dense_3/bias/Read/ReadVariableOpConst*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *(
f#R!
__inference__traced_save_449550
?
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamenet/cheb_conv/kernelnet/cheb_conv/biasnet/dense/kernelnet/dense/biasnet/dense_1/kernelnet/dense_1/biasnet/dense_2/kernelnet/dense_2/biasnet/dense_3/kernelnet/dense_3/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *+
f&R$
"__inference__traced_restore_449590??
?

?
*__inference_cheb_conv_layer_call_fn_449240
inputs_0

inputs	
inputs_1
inputs_2	
unknown: 
	unknown_0: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputsinputs_1inputs_2unknown	unknown_0*
Tin

2		*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:????????? *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *N
fIRG
E__inference_cheb_conv_layer_call_and_return_conditional_losses_448277o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:????????? `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?:?????????:?????????:?????????:: : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?
?
(__inference_dense_3_layer_call_fn_449421

inputs
unknown:	?
	unknown_0:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_dense_3_layer_call_and_return_conditional_losses_448401o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
__inference_loss_fn_4_449493P
=net_dense_3_kernel_regularizer_square_readvariableop_resource:	?
identity??4net/dense_3/kernel/Regularizer/Square/ReadVariableOp?
4net/dense_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOp=net_dense_3_kernel_regularizer_square_readvariableop_resource*
_output_shapes
:	?*
dtype0?
%net/dense_3/kernel/Regularizer/SquareSquare<net/dense_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?u
$net/dense_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_3/kernel/Regularizer/SumSum)net/dense_3/kernel/Regularizer/Square:y:0-net/dense_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_3/kernel/Regularizer/mulMul-net/dense_3/kernel/Regularizer/mul/x:output:0+net/dense_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: d
IdentityIdentity&net/dense_3/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: }
NoOpNoOp5^net/dense_3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2l
4net/dense_3/kernel/Regularizer/Square/ReadVariableOp4net/dense_3/kernel/Regularizer/Square/ReadVariableOp
?
?
__inference_loss_fn_2_449471Q
=net_dense_1_kernel_regularizer_square_readvariableop_resource:
??
identity??4net/dense_1/kernel/Regularizer/Square/ReadVariableOp?
4net/dense_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp=net_dense_1_kernel_regularizer_square_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
%net/dense_1/kernel/Regularizer/SquareSquare<net/dense_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
$net/dense_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_1/kernel/Regularizer/SumSum)net/dense_1/kernel/Regularizer/Square:y:0-net/dense_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_1/kernel/Regularizer/mulMul-net/dense_1/kernel/Regularizer/mul/x:output:0+net/dense_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: d
IdentityIdentity&net/dense_1/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: }
NoOpNoOp5^net/dense_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2l
4net/dense_1/kernel/Regularizer/Square/ReadVariableOp4net/dense_1/kernel/Regularizer/Square/ReadVariableOp
?]
?
?__inference_net_layer_call_and_return_conditional_losses_448438

inputs
inputs_1	
inputs_2
inputs_3	
inputs_4	&
cheb_conv_448278: 
cheb_conv_448280:  
dense_448326:
?2?
dense_448328:	?"
dense_1_448349:
??
dense_1_448351:	?"
dense_2_448379:
??
dense_2_448381:	?!
dense_3_448402:	?
dense_3_448404:
identity??!cheb_conv/StatefulPartitionedCall?dense/StatefulPartitionedCall?dense_1/StatefulPartitionedCall?dense_2/StatefulPartitionedCall?dense_3/StatefulPartitionedCall?6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp?2net/dense/kernel/Regularizer/Square/ReadVariableOp?4net/dense_1/kernel/Regularizer/Square/ReadVariableOp?4net/dense_2/kernel/Regularizer/Square/ReadVariableOp?4net/dense_3/kernel/Regularizer/Square/ReadVariableOpU
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:?????????a
cheb_conv/CastCastCast:y:0*

DstT0*

SrcT0*'
_output_shapes
:??????????
!cheb_conv/StatefulPartitionedCallStatefulPartitionedCallcheb_conv/Cast:y:0inputs_1inputs_2inputs_3cheb_conv_448278cheb_conv_448280*
Tin

2		*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:????????? *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *N
fIRG
E__inference_cheb_conv_layer_call_and_return_conditional_losses_448277_
ShapeShape*cheb_conv/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskL
	truediv/yConst*
_output_shapes
: *
dtype0*
value
B :?\
truediv/CastCaststrided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: Z
truediv/Cast_1Casttruediv/y:output:0*

DstT0*

SrcT0*
_output_shapes
: Y
truedivRealDivtruediv/Cast:y:0truediv/Cast_1:y:0*
T0*
_output_shapes
: X
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
valueB 2      i@X
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
valueB 2      @@?
Reshape/shapePacktruediv:z:0Reshape/shape/1:output:0Reshape/shape/2:output:0*
N*
T0*
_output_shapes
:Q
Reshape/CastCasttruediv:z:0*

DstT0*

SrcT0*
_output_shapes
: T
Reshape/shape_1/1Const*
_output_shapes
: *
dtype0*
value
B :?S
Reshape/shape_1/2Const*
_output_shapes
: *
dtype0*
value	B : ?
Reshape/shape_1PackReshape/Cast:y:0Reshape/shape_1/1:output:0Reshape/shape_1/2:output:0*
N*
T0*
_output_shapes
:?
ReshapeReshape*cheb_conv/StatefulPartitionedCall:output:0Reshape/shape_1:output:0*
T0*,
_output_shapes
:?????????? ?
flatten/PartitionedCallPartitionedCallReshape:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????2* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_flatten_layer_call_and_return_conditional_losses_448306?
dense/StatefulPartitionedCallStatefulPartitionedCall flatten/PartitionedCall:output:0dense_448326dense_448328*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_448325?
dense_1/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0dense_1_448349dense_1_448351*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_dense_1_layer_call_and_return_conditional_losses_448348?
dropout/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_448359?
dense_2/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0dense_2_448379dense_2_448381*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_dense_2_layer_call_and_return_conditional_losses_448378?
dense_3/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0dense_3_448402dense_3_448404*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_dense_3_layer_call_and_return_conditional_losses_448401?
6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOpcheb_conv_448278*"
_output_shapes
: *
dtype0?
'net/cheb_conv/kernel/Regularizer/SquareSquare>net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
: {
&net/cheb_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          ?
$net/cheb_conv/kernel/Regularizer/SumSum+net/cheb_conv/kernel/Regularizer/Square:y:0/net/cheb_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: k
&net/cheb_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
$net/cheb_conv/kernel/Regularizer/mulMul/net/cheb_conv/kernel/Regularizer/mul/x:output:0-net/cheb_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
2net/dense/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdense_448326* 
_output_shapes
:
?2?*
dtype0?
#net/dense/kernel/Regularizer/SquareSquare:net/dense/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
?2?s
"net/dense/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
 net/dense/kernel/Regularizer/SumSum'net/dense/kernel/Regularizer/Square:y:0+net/dense/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"net/dense/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
 net/dense/kernel/Regularizer/mulMul+net/dense/kernel/Regularizer/mul/x:output:0)net/dense/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
4net/dense_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdense_1_448349* 
_output_shapes
:
??*
dtype0?
%net/dense_1/kernel/Regularizer/SquareSquare<net/dense_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
$net/dense_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_1/kernel/Regularizer/SumSum)net/dense_1/kernel/Regularizer/Square:y:0-net/dense_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_1/kernel/Regularizer/mulMul-net/dense_1/kernel/Regularizer/mul/x:output:0+net/dense_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
4net/dense_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdense_2_448379* 
_output_shapes
:
??*
dtype0?
%net/dense_2/kernel/Regularizer/SquareSquare<net/dense_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
$net/dense_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_2/kernel/Regularizer/SumSum)net/dense_2/kernel/Regularizer/Square:y:0-net/dense_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_2/kernel/Regularizer/mulMul-net/dense_2/kernel/Regularizer/mul/x:output:0+net/dense_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
4net/dense_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdense_3_448402*
_output_shapes
:	?*
dtype0?
%net/dense_3/kernel/Regularizer/SquareSquare<net/dense_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?u
$net/dense_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_3/kernel/Regularizer/SumSum)net/dense_3/kernel/Regularizer/Square:y:0-net/dense_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_3/kernel/Regularizer/mulMul-net/dense_3/kernel/Regularizer/mul/x:output:0+net/dense_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: w
IdentityIdentity(dense_3/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp"^cheb_conv/StatefulPartitionedCall^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall7^net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp3^net/dense/kernel/Regularizer/Square/ReadVariableOp5^net/dense_1/kernel/Regularizer/Square/ReadVariableOp5^net/dense_2/kernel/Regularizer/Square/ReadVariableOp5^net/dense_3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*q
_input_shapes`
^:?????????:?????????:?????????::?????????: : : : : : : : : : 2F
!cheb_conv/StatefulPartitionedCall!cheb_conv/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2p
6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp2h
2net/dense/kernel/Regularizer/Square/ReadVariableOp2net/dense/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_1/kernel/Regularizer/Square/ReadVariableOp4net/dense_1/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_2/kernel/Regularizer/Square/ReadVariableOp4net/dense_2/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_3/kernel/Regularizer/Square/ReadVariableOp4net/dense_3/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
C__inference_dense_1_layer_call_and_return_conditional_losses_449374

inputs2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?4net/dense_1/kernel/Regularizer/Square/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????Q
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:???????????
4net/dense_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
%net/dense_1/kernel/Regularizer/SquareSquare<net/dense_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
$net/dense_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_1/kernel/Regularizer/SumSum)net/dense_1/kernel/Regularizer/Square:y:0-net/dense_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_1/kernel/Regularizer/mulMul-net/dense_1/kernel/Regularizer/mul/x:output:0+net/dense_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:???????????
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp5^net/dense_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2l
4net/dense_1/kernel/Regularizer/Square/ReadVariableOp4net/dense_1/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
??
?

?__inference_net_layer_call_and_return_conditional_losses_449222
inputs_0

inputs	
inputs_1
inputs_2	

inputs_2_0	7
!cheb_conv_readvariableop_resource: 7
)cheb_conv_biasadd_readvariableop_resource: 8
$dense_matmul_readvariableop_resource:
?2?4
%dense_biasadd_readvariableop_resource:	?:
&dense_1_matmul_readvariableop_resource:
??6
'dense_1_biasadd_readvariableop_resource:	?:
&dense_2_matmul_readvariableop_resource:
??6
'dense_2_biasadd_readvariableop_resource:	?9
&dense_3_matmul_readvariableop_resource:	?5
'dense_3_biasadd_readvariableop_resource:
identity?? cheb_conv/BiasAdd/ReadVariableOp?cheb_conv/ReadVariableOp?cheb_conv/ReadVariableOp_1?dense/BiasAdd/ReadVariableOp?dense/MatMul/ReadVariableOp?dense_1/BiasAdd/ReadVariableOp?dense_1/MatMul/ReadVariableOp?dense_2/BiasAdd/ReadVariableOp?dense_2/MatMul/ReadVariableOp?dense_3/BiasAdd/ReadVariableOp?dense_3/MatMul/ReadVariableOp?6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp?2net/dense/kernel/Regularizer/Square/ReadVariableOp?4net/dense_1/kernel/Regularizer/Square/ReadVariableOp?4net/dense_2/kernel/Regularizer/Square/ReadVariableOp?4net/dense_3/kernel/Regularizer/Square/ReadVariableOpW
CastCastinputs_0*

DstT0*

SrcT0*'
_output_shapes
:?????????a
cheb_conv/CastCastCast:y:0*

DstT0*

SrcT0*'
_output_shapes
:?????????~
cheb_conv/ReadVariableOpReadVariableOp!cheb_conv_readvariableop_resource*"
_output_shapes
: *
dtype0g
cheb_conv/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: i
cheb_conv/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:i
cheb_conv/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
cheb_conv/strided_sliceStridedSlice cheb_conv/ReadVariableOp:value:0&cheb_conv/strided_slice/stack:output:0(cheb_conv/strided_slice/stack_1:output:0(cheb_conv/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes

: *
shrink_axis_mask?
cheb_conv/MatMulMatMulcheb_conv/Cast:y:0 cheb_conv/strided_slice:output:0*
T0*'
_output_shapes
:????????? ?
9cheb_conv/SparseTensorDenseMatMul/SparseTensorDenseMatMulSparseTensorDenseMatMulinputsinputs_1inputs_2cheb_conv/Cast:y:0*
T0*'
_output_shapes
:??????????
cheb_conv/ReadVariableOp_1ReadVariableOp!cheb_conv_readvariableop_resource*"
_output_shapes
: *
dtype0i
cheb_conv/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:k
!cheb_conv/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:k
!cheb_conv/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
cheb_conv/strided_slice_1StridedSlice"cheb_conv/ReadVariableOp_1:value:0(cheb_conv/strided_slice_1/stack:output:0*cheb_conv/strided_slice_1/stack_1:output:0*cheb_conv/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

: *
shrink_axis_mask?
cheb_conv/MatMul_1MatMulCcheb_conv/SparseTensorDenseMatMul/SparseTensorDenseMatMul:product:0"cheb_conv/strided_slice_1:output:0*
T0*'
_output_shapes
:????????? ?
cheb_conv/addAddV2cheb_conv/MatMul:product:0cheb_conv/MatMul_1:product:0*
T0*'
_output_shapes
:????????? ?
 cheb_conv/BiasAdd/ReadVariableOpReadVariableOp)cheb_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0?
cheb_conv/BiasAddBiasAddcheb_conv/add:z:0(cheb_conv/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? b
cheb_conv/EluElucheb_conv/BiasAdd:output:0*
T0*'
_output_shapes
:????????? P
ShapeShapecheb_conv/Elu:activations:0*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskL
	truediv/yConst*
_output_shapes
: *
dtype0*
value
B :?\
truediv/CastCaststrided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: Z
truediv/Cast_1Casttruediv/y:output:0*

DstT0*

SrcT0*
_output_shapes
: Y
truedivRealDivtruediv/Cast:y:0truediv/Cast_1:y:0*
T0*
_output_shapes
: X
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
valueB 2      i@X
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
valueB 2      @@?
Reshape/shapePacktruediv:z:0Reshape/shape/1:output:0Reshape/shape/2:output:0*
N*
T0*
_output_shapes
:Q
Reshape/CastCasttruediv:z:0*

DstT0*

SrcT0*
_output_shapes
: T
Reshape/shape_1/1Const*
_output_shapes
: *
dtype0*
value
B :?S
Reshape/shape_1/2Const*
_output_shapes
: *
dtype0*
value	B : ?
Reshape/shape_1PackReshape/Cast:y:0Reshape/shape_1/1:output:0Reshape/shape_1/2:output:0*
N*
T0*
_output_shapes
:?
ReshapeReshapecheb_conv/Elu:activations:0Reshape/shape_1:output:0*
T0*,
_output_shapes
:?????????? ^
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"????   w
flatten/ReshapeReshapeReshape:output:0flatten/Const:output:0*
T0*(
_output_shapes
:??????????2?
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource* 
_output_shapes
:
?2?*
dtype0?
dense/MatMulMatMulflatten/Reshape:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????]

dense/ReluReludense/BiasAdd:output:0*
T0*(
_output_shapes
:???????????
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
dense_1/MatMulMatMuldense/Relu:activations:0%dense_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????a
dense_1/ReluReludense_1/BiasAdd:output:0*
T0*(
_output_shapes
:??????????Z
dropout/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @?
dropout/dropout/MulMuldense_1/Relu:activations:0dropout/dropout/Const:output:0*
T0*(
_output_shapes
:??????????_
dropout/dropout/ShapeShapedense_1/Relu:activations:0*
T0*
_output_shapes
:?
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape:output:0*
T0*(
_output_shapes
:??????????*
dtype0c
dropout/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ??
dropout/dropout/GreaterEqualGreaterEqual5dropout/dropout/random_uniform/RandomUniform:output:0'dropout/dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:???????????
dropout/dropout/CastCast dropout/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:???????????
dropout/dropout/Mul_1Muldropout/dropout/Mul:z:0dropout/dropout/Cast:y:0*
T0*(
_output_shapes
:???????????
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
dense_2/MatMulMatMuldropout/dropout/Mul_1:z:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????a
dense_2/ReluReludense_2/BiasAdd:output:0*
T0*(
_output_shapes
:???????????
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource*
_output_shapes
:	?*
dtype0?
dense_3/MatMulMatMuldense_2/Relu:activations:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
dense_3/BiasAddBiasAdddense_3/MatMul:product:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????f
dense_3/SigmoidSigmoiddense_3/BiasAdd:output:0*
T0*'
_output_shapes
:??????????
6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOp!cheb_conv_readvariableop_resource*"
_output_shapes
: *
dtype0?
'net/cheb_conv/kernel/Regularizer/SquareSquare>net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
: {
&net/cheb_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          ?
$net/cheb_conv/kernel/Regularizer/SumSum+net/cheb_conv/kernel/Regularizer/Square:y:0/net/cheb_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: k
&net/cheb_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
$net/cheb_conv/kernel/Regularizer/mulMul/net/cheb_conv/kernel/Regularizer/mul/x:output:0-net/cheb_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
2net/dense/kernel/Regularizer/Square/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource* 
_output_shapes
:
?2?*
dtype0?
#net/dense/kernel/Regularizer/SquareSquare:net/dense/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
?2?s
"net/dense/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
 net/dense/kernel/Regularizer/SumSum'net/dense/kernel/Regularizer/Square:y:0+net/dense/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"net/dense/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
 net/dense/kernel/Regularizer/mulMul+net/dense/kernel/Regularizer/mul/x:output:0)net/dense/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
4net/dense_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
%net/dense_1/kernel/Regularizer/SquareSquare<net/dense_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
$net/dense_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_1/kernel/Regularizer/SumSum)net/dense_1/kernel/Regularizer/Square:y:0-net/dense_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_1/kernel/Regularizer/mulMul-net/dense_1/kernel/Regularizer/mul/x:output:0+net/dense_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
4net/dense_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
%net/dense_2/kernel/Regularizer/SquareSquare<net/dense_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
$net/dense_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_2/kernel/Regularizer/SumSum)net/dense_2/kernel/Regularizer/Square:y:0-net/dense_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_2/kernel/Regularizer/mulMul-net/dense_2/kernel/Regularizer/mul/x:output:0+net/dense_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
4net/dense_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource*
_output_shapes
:	?*
dtype0?
%net/dense_3/kernel/Regularizer/SquareSquare<net/dense_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?u
$net/dense_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_3/kernel/Regularizer/SumSum)net/dense_3/kernel/Regularizer/Square:y:0-net/dense_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_3/kernel/Regularizer/mulMul-net/dense_3/kernel/Regularizer/mul/x:output:0+net/dense_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentitydense_3/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp!^cheb_conv/BiasAdd/ReadVariableOp^cheb_conv/ReadVariableOp^cheb_conv/ReadVariableOp_1^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp^dense_1/BiasAdd/ReadVariableOp^dense_1/MatMul/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp^dense_3/MatMul/ReadVariableOp7^net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp3^net/dense/kernel/Regularizer/Square/ReadVariableOp5^net/dense_1/kernel/Regularizer/Square/ReadVariableOp5^net/dense_2/kernel/Regularizer/Square/ReadVariableOp5^net/dense_3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*q
_input_shapes`
^:?????????:?????????:?????????::?????????: : : : : : : : : : 2D
 cheb_conv/BiasAdd/ReadVariableOp cheb_conv/BiasAdd/ReadVariableOp24
cheb_conv/ReadVariableOpcheb_conv/ReadVariableOp28
cheb_conv/ReadVariableOp_1cheb_conv/ReadVariableOp_12<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp2p
6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp2h
2net/dense/kernel/Regularizer/Square/ReadVariableOp2net/dense/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_1/kernel/Regularizer/Square/ReadVariableOp4net/dense_1/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_2/kernel/Regularizer/Square/ReadVariableOp4net/dense_2/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_3/kernel/Regularizer/Square/ReadVariableOp4net/dense_3/kernel/Regularizer/Square/ReadVariableOp:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs:MI
#
_output_shapes
:?????????
"
_user_specified_name
inputs/2
?!
?
E__inference_cheb_conv_layer_call_and_return_conditional_losses_448277

inputs
inputs_1	
inputs_2
inputs_3	-
readvariableop_resource: -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?ReadVariableOp?ReadVariableOp_1?6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOpj
ReadVariableOpReadVariableOpreadvariableop_resource*"
_output_shapes
: *
dtype0]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
strided_sliceStridedSliceReadVariableOp:value:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes

: *
shrink_axis_maskb
MatMulMatMulinputsstrided_slice:output:0*
T0*'
_output_shapes
:????????? ?
/SparseTensorDenseMatMul/SparseTensorDenseMatMulSparseTensorDenseMatMulinputs_1inputs_2inputs_3inputs*
T0*'
_output_shapes
:?????????l
ReadVariableOp_1ReadVariableOpreadvariableop_resource*"
_output_shapes
: *
dtype0_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
strided_slice_1StridedSliceReadVariableOp_1:value:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

: *
shrink_axis_mask?
MatMul_1MatMul9SparseTensorDenseMatMul/SparseTensorDenseMatMul:product:0strided_slice_1:output:0*
T0*'
_output_shapes
:????????? d
addAddV2MatMul:product:0MatMul_1:product:0*
T0*'
_output_shapes
:????????? r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0m
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? N
EluEluBiasAdd:output:0*
T0*'
_output_shapes
:????????? ?
6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOpreadvariableop_resource*"
_output_shapes
: *
dtype0?
'net/cheb_conv/kernel/Regularizer/SquareSquare>net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
: {
&net/cheb_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          ?
$net/cheb_conv/kernel/Regularizer/SumSum+net/cheb_conv/kernel/Regularizer/Square:y:0/net/cheb_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: k
&net/cheb_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
$net/cheb_conv/kernel/Regularizer/mulMul/net/cheb_conv/kernel/Regularizer/mul/x:output:0-net/cheb_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: `
IdentityIdentityElu:activations:0^NoOp*
T0*'
_output_shapes
:????????? ?
NoOpNoOp^BiasAdd/ReadVariableOp^ReadVariableOp^ReadVariableOp_17^net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?:?????????:?????????:?????????:: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12p
6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?
?
C__inference_dense_2_layer_call_and_return_conditional_losses_448378

inputs2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?4net/dense_2/kernel/Regularizer/Square/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????Q
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:???????????
4net/dense_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
%net/dense_2/kernel/Regularizer/SquareSquare<net/dense_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
$net/dense_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_2/kernel/Regularizer/SumSum)net/dense_2/kernel/Regularizer/Square:y:0-net/dense_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_2/kernel/Regularizer/mulMul-net/dense_2/kernel/Regularizer/mul/x:output:0+net/dense_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:???????????
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp5^net/dense_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2l
4net/dense_2/kernel/Regularizer/Square/ReadVariableOp4net/dense_2/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
a
C__inference_dropout_layer_call_and_return_conditional_losses_448359

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:??????????\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:??????????"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:??????????:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?*
?
"__inference__traced_restore_449590
file_prefix;
%assignvariableop_net_cheb_conv_kernel: 3
%assignvariableop_1_net_cheb_conv_bias: 7
#assignvariableop_2_net_dense_kernel:
?2?0
!assignvariableop_3_net_dense_bias:	?9
%assignvariableop_4_net_dense_1_kernel:
??2
#assignvariableop_5_net_dense_1_bias:	?9
%assignvariableop_6_net_dense_2_kernel:
??2
#assignvariableop_7_net_dense_2_bias:	?8
%assignvariableop_8_net_dense_3_kernel:	?1
#assignvariableop_9_net_dense_3_bias:
identity_11??AssignVariableOp?AssignVariableOp_1?AssignVariableOp_2?AssignVariableOp_3?AssignVariableOp_4?AssignVariableOp_5?AssignVariableOp_6?AssignVariableOp_7?AssignVariableOp_8?AssignVariableOp_9?
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value?B?B&conv/kernel/.ATTRIBUTES/VARIABLE_VALUEB$conv/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense1/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense1/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense2/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense2/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense3/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense3/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense4/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense4/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH?
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*)
value BB B B B B B B B B B B ?
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*@
_output_shapes.
,:::::::::::*
dtypes
2[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOpAssignVariableOp%assignvariableop_net_cheb_conv_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_1AssignVariableOp%assignvariableop_1_net_cheb_conv_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_2AssignVariableOp#assignvariableop_2_net_dense_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_3AssignVariableOp!assignvariableop_3_net_dense_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_4AssignVariableOp%assignvariableop_4_net_dense_1_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_5AssignVariableOp#assignvariableop_5_net_dense_1_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_6AssignVariableOp%assignvariableop_6_net_dense_2_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_7AssignVariableOp#assignvariableop_7_net_dense_2_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_8AssignVariableOp%assignvariableop_8_net_dense_3_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_9AssignVariableOp#assignvariableop_9_net_dense_3_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 ?
Identity_10Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_11IdentityIdentity_10:output:0^NoOp_1*
T0*
_output_shapes
: ?
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_11Identity_11:output:0*)
_input_shapes
: : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12(
AssignVariableOp_2AssignVariableOp_22(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
?
a
(__inference_dropout_layer_call_fn_449282

inputs
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_448501p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:??????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:??????????22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
D
(__inference_flatten_layer_call_fn_449304

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????2* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_flatten_layer_call_and_return_conditional_losses_448306a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:??????????2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????? :T P
,
_output_shapes
:?????????? 
 
_user_specified_nameinputs
?
?
__inference__traced_save_449550
file_prefix3
/savev2_net_cheb_conv_kernel_read_readvariableop1
-savev2_net_cheb_conv_bias_read_readvariableop/
+savev2_net_dense_kernel_read_readvariableop-
)savev2_net_dense_bias_read_readvariableop1
-savev2_net_dense_1_kernel_read_readvariableop/
+savev2_net_dense_1_bias_read_readvariableop1
-savev2_net_dense_2_kernel_read_readvariableop/
+savev2_net_dense_2_bias_read_readvariableop1
-savev2_net_dense_3_kernel_read_readvariableop/
+savev2_net_dense_3_bias_read_readvariableop
savev2_const

identity_1??MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part?
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : ?
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: ?
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value?B?B&conv/kernel/.ATTRIBUTES/VARIABLE_VALUEB$conv/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense1/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense1/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense2/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense2/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense3/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense3/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense4/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense4/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH?
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*)
value BB B B B B B B B B B B ?
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0/savev2_net_cheb_conv_kernel_read_readvariableop-savev2_net_cheb_conv_bias_read_readvariableop+savev2_net_dense_kernel_read_readvariableop)savev2_net_dense_bias_read_readvariableop-savev2_net_dense_1_kernel_read_readvariableop+savev2_net_dense_1_bias_read_readvariableop-savev2_net_dense_2_kernel_read_readvariableop+savev2_net_dense_2_bias_read_readvariableop-savev2_net_dense_3_kernel_read_readvariableop+savev2_net_dense_3_bias_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *
dtypes
2?
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:?
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*u
_input_shapesd
b: : : :
?2?:?:
??:?:
??:?:	?:: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:($
"
_output_shapes
: : 

_output_shapes
: :&"
 
_output_shapes
:
?2?:!

_output_shapes	
:?:&"
 
_output_shapes
:
??:!

_output_shapes	
:?:&"
 
_output_shapes
:
??:!

_output_shapes	
:?:%	!

_output_shapes
:	?: 


_output_shapes
::

_output_shapes
: 
?
D
(__inference_dropout_layer_call_fn_449277

inputs
identity?
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_448359a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:??????????:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
C__inference_dense_3_layer_call_and_return_conditional_losses_449438

inputs1
matmul_readvariableop_resource:	?-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?4net/dense_3/kernel/Regularizer/Square/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:??????????
4net/dense_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?*
dtype0?
%net/dense_3/kernel/Regularizer/SquareSquare<net/dense_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?u
$net/dense_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_3/kernel/Regularizer/SumSum)net/dense_3/kernel/Regularizer/Square:y:0-net/dense_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_3/kernel/Regularizer/mulMul-net/dense_3/kernel/Regularizer/mul/x:output:0+net/dense_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp5^net/dense_3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2l
4net/dense_3/kernel/Regularizer/Square/ReadVariableOp4net/dense_3/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
A__inference_dense_layer_call_and_return_conditional_losses_448325

inputs2
matmul_readvariableop_resource:
?2?.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?2net/dense/kernel/Regularizer/Square/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
?2?*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????Q
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:???????????
2net/dense/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
?2?*
dtype0?
#net/dense/kernel/Regularizer/SquareSquare:net/dense/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
?2?s
"net/dense/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
 net/dense/kernel/Regularizer/SumSum'net/dense/kernel/Regularizer/Square:y:0+net/dense/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"net/dense/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
 net/dense/kernel/Regularizer/mulMul+net/dense/kernel/Regularizer/mul/x:output:0)net/dense/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:???????????
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp3^net/dense/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????2: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2h
2net/dense/kernel/Regularizer/Square/ReadVariableOp2net/dense/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:??????????2
 
_user_specified_nameinputs
?
?
(__inference_dense_2_layer_call_fn_449389

inputs
unknown:
??
	unknown_0:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_dense_2_layer_call_and_return_conditional_losses_448378p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:??????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
__inference_loss_fn_1_449460O
;net_dense_kernel_regularizer_square_readvariableop_resource:
?2?
identity??2net/dense/kernel/Regularizer/Square/ReadVariableOp?
2net/dense/kernel/Regularizer/Square/ReadVariableOpReadVariableOp;net_dense_kernel_regularizer_square_readvariableop_resource* 
_output_shapes
:
?2?*
dtype0?
#net/dense/kernel/Regularizer/SquareSquare:net/dense/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
?2?s
"net/dense/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
 net/dense/kernel/Regularizer/SumSum'net/dense/kernel/Regularizer/Square:y:0+net/dense/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"net/dense/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
 net/dense/kernel/Regularizer/mulMul+net/dense/kernel/Regularizer/mul/x:output:0)net/dense/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentity$net/dense/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: {
NoOpNoOp3^net/dense/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2h
2net/dense/kernel/Regularizer/Square/ReadVariableOp2net/dense/kernel/Regularizer/Square/ReadVariableOp
?
_
C__inference_flatten_layer_call_and_return_conditional_losses_448306

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"????   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:??????????2Y
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:??????????2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????? :T P
,
_output_shapes
:?????????? 
 
_user_specified_nameinputs
?^
?
?__inference_net_layer_call_and_return_conditional_losses_448662

inputs
inputs_1	
inputs_2
inputs_3	
inputs_4	&
cheb_conv_448587: 
cheb_conv_448589:  
dense_448610:
?2?
dense_448612:	?"
dense_1_448615:
??
dense_1_448617:	?"
dense_2_448621:
??
dense_2_448623:	?!
dense_3_448626:	?
dense_3_448628:
identity??!cheb_conv/StatefulPartitionedCall?dense/StatefulPartitionedCall?dense_1/StatefulPartitionedCall?dense_2/StatefulPartitionedCall?dense_3/StatefulPartitionedCall?dropout/StatefulPartitionedCall?6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp?2net/dense/kernel/Regularizer/Square/ReadVariableOp?4net/dense_1/kernel/Regularizer/Square/ReadVariableOp?4net/dense_2/kernel/Regularizer/Square/ReadVariableOp?4net/dense_3/kernel/Regularizer/Square/ReadVariableOpU
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:?????????a
cheb_conv/CastCastCast:y:0*

DstT0*

SrcT0*'
_output_shapes
:??????????
!cheb_conv/StatefulPartitionedCallStatefulPartitionedCallcheb_conv/Cast:y:0inputs_1inputs_2inputs_3cheb_conv_448587cheb_conv_448589*
Tin

2		*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:????????? *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *N
fIRG
E__inference_cheb_conv_layer_call_and_return_conditional_losses_448277_
ShapeShape*cheb_conv/StatefulPartitionedCall:output:0*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskL
	truediv/yConst*
_output_shapes
: *
dtype0*
value
B :?\
truediv/CastCaststrided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: Z
truediv/Cast_1Casttruediv/y:output:0*

DstT0*

SrcT0*
_output_shapes
: Y
truedivRealDivtruediv/Cast:y:0truediv/Cast_1:y:0*
T0*
_output_shapes
: X
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
valueB 2      i@X
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
valueB 2      @@?
Reshape/shapePacktruediv:z:0Reshape/shape/1:output:0Reshape/shape/2:output:0*
N*
T0*
_output_shapes
:Q
Reshape/CastCasttruediv:z:0*

DstT0*

SrcT0*
_output_shapes
: T
Reshape/shape_1/1Const*
_output_shapes
: *
dtype0*
value
B :?S
Reshape/shape_1/2Const*
_output_shapes
: *
dtype0*
value	B : ?
Reshape/shape_1PackReshape/Cast:y:0Reshape/shape_1/1:output:0Reshape/shape_1/2:output:0*
N*
T0*
_output_shapes
:?
ReshapeReshape*cheb_conv/StatefulPartitionedCall:output:0Reshape/shape_1:output:0*
T0*,
_output_shapes
:?????????? ?
flatten/PartitionedCallPartitionedCallReshape:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????2* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_flatten_layer_call_and_return_conditional_losses_448306?
dense/StatefulPartitionedCallStatefulPartitionedCall flatten/PartitionedCall:output:0dense_448610dense_448612*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_448325?
dense_1/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0dense_1_448615dense_1_448617*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_dense_1_layer_call_and_return_conditional_losses_448348?
dropout/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_448501?
dense_2/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0dense_2_448621dense_2_448623*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_dense_2_layer_call_and_return_conditional_losses_448378?
dense_3/StatefulPartitionedCallStatefulPartitionedCall(dense_2/StatefulPartitionedCall:output:0dense_3_448626dense_3_448628*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_dense_3_layer_call_and_return_conditional_losses_448401?
6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOpcheb_conv_448587*"
_output_shapes
: *
dtype0?
'net/cheb_conv/kernel/Regularizer/SquareSquare>net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
: {
&net/cheb_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          ?
$net/cheb_conv/kernel/Regularizer/SumSum+net/cheb_conv/kernel/Regularizer/Square:y:0/net/cheb_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: k
&net/cheb_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
$net/cheb_conv/kernel/Regularizer/mulMul/net/cheb_conv/kernel/Regularizer/mul/x:output:0-net/cheb_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
2net/dense/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdense_448610* 
_output_shapes
:
?2?*
dtype0?
#net/dense/kernel/Regularizer/SquareSquare:net/dense/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
?2?s
"net/dense/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
 net/dense/kernel/Regularizer/SumSum'net/dense/kernel/Regularizer/Square:y:0+net/dense/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"net/dense/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
 net/dense/kernel/Regularizer/mulMul+net/dense/kernel/Regularizer/mul/x:output:0)net/dense/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
4net/dense_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdense_1_448615* 
_output_shapes
:
??*
dtype0?
%net/dense_1/kernel/Regularizer/SquareSquare<net/dense_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
$net/dense_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_1/kernel/Regularizer/SumSum)net/dense_1/kernel/Regularizer/Square:y:0-net/dense_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_1/kernel/Regularizer/mulMul-net/dense_1/kernel/Regularizer/mul/x:output:0+net/dense_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
4net/dense_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdense_2_448621* 
_output_shapes
:
??*
dtype0?
%net/dense_2/kernel/Regularizer/SquareSquare<net/dense_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
$net/dense_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_2/kernel/Regularizer/SumSum)net/dense_2/kernel/Regularizer/Square:y:0-net/dense_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_2/kernel/Regularizer/mulMul-net/dense_2/kernel/Regularizer/mul/x:output:0+net/dense_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
4net/dense_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdense_3_448626*
_output_shapes
:	?*
dtype0?
%net/dense_3/kernel/Regularizer/SquareSquare<net/dense_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?u
$net/dense_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_3/kernel/Regularizer/SumSum)net/dense_3/kernel/Regularizer/Square:y:0-net/dense_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_3/kernel/Regularizer/mulMul-net/dense_3/kernel/Regularizer/mul/x:output:0+net/dense_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: w
IdentityIdentity(dense_3/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp"^cheb_conv/StatefulPartitionedCall^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dense_3/StatefulPartitionedCall ^dropout/StatefulPartitionedCall7^net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp3^net/dense/kernel/Regularizer/Square/ReadVariableOp5^net/dense_1/kernel/Regularizer/Square/ReadVariableOp5^net/dense_2/kernel/Regularizer/Square/ReadVariableOp5^net/dense_3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*q
_input_shapes`
^:?????????:?????????:?????????::?????????: : : : : : : : : : 2F
!cheb_conv/StatefulPartitionedCall!cheb_conv/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2p
6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp2h
2net/dense/kernel/Regularizer/Square/ReadVariableOp2net/dense/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_1/kernel/Regularizer/Square/ReadVariableOp4net/dense_1/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_2/kernel/Regularizer/Square/ReadVariableOp4net/dense_2/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_3/kernel/Regularizer/Square/ReadVariableOp4net/dense_3/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameinputs:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs
?
?
__inference_loss_fn_3_449482Q
=net_dense_2_kernel_regularizer_square_readvariableop_resource:
??
identity??4net/dense_2/kernel/Regularizer/Square/ReadVariableOp?
4net/dense_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp=net_dense_2_kernel_regularizer_square_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
%net/dense_2/kernel/Regularizer/SquareSquare<net/dense_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
$net/dense_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_2/kernel/Regularizer/SumSum)net/dense_2/kernel/Regularizer/Square:y:0-net/dense_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_2/kernel/Regularizer/mulMul-net/dense_2/kernel/Regularizer/mul/x:output:0+net/dense_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: d
IdentityIdentity&net/dense_2/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: }
NoOpNoOp5^net/dense_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2l
4net/dense_2/kernel/Regularizer/Square/ReadVariableOp4net/dense_2/kernel/Regularizer/Square/ReadVariableOp
?
?
C__inference_dense_2_layer_call_and_return_conditional_losses_449406

inputs2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?4net/dense_2/kernel/Regularizer/Square/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????Q
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:???????????
4net/dense_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
%net/dense_2/kernel/Regularizer/SquareSquare<net/dense_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
$net/dense_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_2/kernel/Regularizer/SumSum)net/dense_2/kernel/Regularizer/Square:y:0-net/dense_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_2/kernel/Regularizer/mulMul-net/dense_2/kernel/Regularizer/mul/x:output:0+net/dense_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:???????????
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp5^net/dense_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2l
4net/dense_2/kernel/Regularizer/Square/ReadVariableOp4net/dense_2/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
&__inference_dense_layer_call_fn_449325

inputs
unknown:
?2?
	unknown_0:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_448325p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:??????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????2: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:??????????2
 
_user_specified_nameinputs
?
?
A__inference_dense_layer_call_and_return_conditional_losses_449342

inputs2
matmul_readvariableop_resource:
?2?.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?2net/dense/kernel/Regularizer/Square/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
?2?*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????Q
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:???????????
2net/dense/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
?2?*
dtype0?
#net/dense/kernel/Regularizer/SquareSquare:net/dense/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
?2?s
"net/dense/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
 net/dense/kernel/Regularizer/SumSum'net/dense/kernel/Regularizer/Square:y:0+net/dense/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"net/dense/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
 net/dense/kernel/Regularizer/mulMul+net/dense/kernel/Regularizer/mul/x:output:0)net/dense/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:???????????
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp3^net/dense/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????2: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2h
2net/dense/kernel/Regularizer/Square/ReadVariableOp2net/dense/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:??????????2
 
_user_specified_nameinputs
?
?
(__inference_dense_1_layer_call_fn_449357

inputs
unknown:
??
	unknown_0:	?
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *L
fGRE
C__inference_dense_1_layer_call_and_return_conditional_losses_448348p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:??????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
_
C__inference_flatten_layer_call_and_return_conditional_losses_449310

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"????   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:??????????2Y
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:??????????2"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:?????????? :T P
,
_output_shapes
:?????????? 
 
_user_specified_nameinputs
?
?
$__inference_signature_wrapper_448943

args_0
args_0_1	
args_0_2
args_0_3	
args_0_4	
unknown: 
	unknown_0: 
	unknown_1:
?2?
	unknown_2:	?
	unknown_3:
??
	unknown_4:	?
	unknown_5:
??
	unknown_6:	?
	unknown_7:	?
	unknown_8:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallargs_0args_0_1args_0_2args_0_3args_0_4unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2			*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*,
_read_only_resource_inputs

	
*0
config_proto 

CPU

GPU2*0J 8? **
f%R#
!__inference__wrapped_model_448228o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*q
_input_shapes`
^:?????????:?????????:?????????::?????????: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:?????????
 
_user_specified_nameargs_0:QM
'
_output_shapes
:?????????
"
_user_specified_name
args_0_1:MI
#
_output_shapes
:?????????
"
_user_specified_name
args_0_2:D@

_output_shapes
:
"
_user_specified_name
args_0_3:MI
#
_output_shapes
:?????????
"
_user_specified_name
args_0_4
?U
?
!__inference__wrapped_model_448228

args_0
args_0_1	
args_0_2
args_0_3	
args_0_4	;
%net_cheb_conv_readvariableop_resource: ;
-net_cheb_conv_biasadd_readvariableop_resource: <
(net_dense_matmul_readvariableop_resource:
?2?8
)net_dense_biasadd_readvariableop_resource:	?>
*net_dense_1_matmul_readvariableop_resource:
??:
+net_dense_1_biasadd_readvariableop_resource:	?>
*net_dense_2_matmul_readvariableop_resource:
??:
+net_dense_2_biasadd_readvariableop_resource:	?=
*net_dense_3_matmul_readvariableop_resource:	?9
+net_dense_3_biasadd_readvariableop_resource:
identity??$net/cheb_conv/BiasAdd/ReadVariableOp?net/cheb_conv/ReadVariableOp?net/cheb_conv/ReadVariableOp_1? net/dense/BiasAdd/ReadVariableOp?net/dense/MatMul/ReadVariableOp?"net/dense_1/BiasAdd/ReadVariableOp?!net/dense_1/MatMul/ReadVariableOp?"net/dense_2/BiasAdd/ReadVariableOp?!net/dense_2/MatMul/ReadVariableOp?"net/dense_3/BiasAdd/ReadVariableOp?!net/dense_3/MatMul/ReadVariableOpY
net/CastCastargs_0*

DstT0*

SrcT0*'
_output_shapes
:?????????i
net/cheb_conv/CastCastnet/Cast:y:0*

DstT0*

SrcT0*'
_output_shapes
:??????????
net/cheb_conv/ReadVariableOpReadVariableOp%net_cheb_conv_readvariableop_resource*"
_output_shapes
: *
dtype0k
!net/cheb_conv/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: m
#net/cheb_conv/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:m
#net/cheb_conv/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
net/cheb_conv/strided_sliceStridedSlice$net/cheb_conv/ReadVariableOp:value:0*net/cheb_conv/strided_slice/stack:output:0,net/cheb_conv/strided_slice/stack_1:output:0,net/cheb_conv/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes

: *
shrink_axis_mask?
net/cheb_conv/MatMulMatMulnet/cheb_conv/Cast:y:0$net/cheb_conv/strided_slice:output:0*
T0*'
_output_shapes
:????????? ?
=net/cheb_conv/SparseTensorDenseMatMul/SparseTensorDenseMatMulSparseTensorDenseMatMulargs_0_1args_0_2args_0_3net/cheb_conv/Cast:y:0*
T0*'
_output_shapes
:??????????
net/cheb_conv/ReadVariableOp_1ReadVariableOp%net_cheb_conv_readvariableop_resource*"
_output_shapes
: *
dtype0m
#net/cheb_conv/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:o
%net/cheb_conv/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:o
%net/cheb_conv/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
net/cheb_conv/strided_slice_1StridedSlice&net/cheb_conv/ReadVariableOp_1:value:0,net/cheb_conv/strided_slice_1/stack:output:0.net/cheb_conv/strided_slice_1/stack_1:output:0.net/cheb_conv/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

: *
shrink_axis_mask?
net/cheb_conv/MatMul_1MatMulGnet/cheb_conv/SparseTensorDenseMatMul/SparseTensorDenseMatMul:product:0&net/cheb_conv/strided_slice_1:output:0*
T0*'
_output_shapes
:????????? ?
net/cheb_conv/addAddV2net/cheb_conv/MatMul:product:0 net/cheb_conv/MatMul_1:product:0*
T0*'
_output_shapes
:????????? ?
$net/cheb_conv/BiasAdd/ReadVariableOpReadVariableOp-net_cheb_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0?
net/cheb_conv/BiasAddBiasAddnet/cheb_conv/add:z:0,net/cheb_conv/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? j
net/cheb_conv/EluElunet/cheb_conv/BiasAdd:output:0*
T0*'
_output_shapes
:????????? X
	net/ShapeShapenet/cheb_conv/Elu:activations:0*
T0*
_output_shapes
:a
net/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: c
net/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:c
net/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
net/strided_sliceStridedSlicenet/Shape:output:0 net/strided_slice/stack:output:0"net/strided_slice/stack_1:output:0"net/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskP
net/truediv/yConst*
_output_shapes
: *
dtype0*
value
B :?d
net/truediv/CastCastnet/strided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: b
net/truediv/Cast_1Castnet/truediv/y:output:0*

DstT0*

SrcT0*
_output_shapes
: e
net/truedivRealDivnet/truediv/Cast:y:0net/truediv/Cast_1:y:0*
T0*
_output_shapes
: \
net/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
valueB 2      i@\
net/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
valueB 2      @@?
net/Reshape/shapePacknet/truediv:z:0net/Reshape/shape/1:output:0net/Reshape/shape/2:output:0*
N*
T0*
_output_shapes
:Y
net/Reshape/CastCastnet/truediv:z:0*

DstT0*

SrcT0*
_output_shapes
: X
net/Reshape/shape_1/1Const*
_output_shapes
: *
dtype0*
value
B :?W
net/Reshape/shape_1/2Const*
_output_shapes
: *
dtype0*
value	B : ?
net/Reshape/shape_1Packnet/Reshape/Cast:y:0net/Reshape/shape_1/1:output:0net/Reshape/shape_1/2:output:0*
N*
T0*
_output_shapes
:?
net/ReshapeReshapenet/cheb_conv/Elu:activations:0net/Reshape/shape_1:output:0*
T0*,
_output_shapes
:?????????? b
net/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"????   ?
net/flatten/ReshapeReshapenet/Reshape:output:0net/flatten/Const:output:0*
T0*(
_output_shapes
:??????????2?
net/dense/MatMul/ReadVariableOpReadVariableOp(net_dense_matmul_readvariableop_resource* 
_output_shapes
:
?2?*
dtype0?
net/dense/MatMulMatMulnet/flatten/Reshape:output:0'net/dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
 net/dense/BiasAdd/ReadVariableOpReadVariableOp)net_dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
net/dense/BiasAddBiasAddnet/dense/MatMul:product:0(net/dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????e
net/dense/ReluRelunet/dense/BiasAdd:output:0*
T0*(
_output_shapes
:???????????
!net/dense_1/MatMul/ReadVariableOpReadVariableOp*net_dense_1_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
net/dense_1/MatMulMatMulnet/dense/Relu:activations:0)net/dense_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
"net/dense_1/BiasAdd/ReadVariableOpReadVariableOp+net_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
net/dense_1/BiasAddBiasAddnet/dense_1/MatMul:product:0*net/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????i
net/dense_1/ReluRelunet/dense_1/BiasAdd:output:0*
T0*(
_output_shapes
:??????????s
net/dropout/IdentityIdentitynet/dense_1/Relu:activations:0*
T0*(
_output_shapes
:???????????
!net/dense_2/MatMul/ReadVariableOpReadVariableOp*net_dense_2_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
net/dense_2/MatMulMatMulnet/dropout/Identity:output:0)net/dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
"net/dense_2/BiasAdd/ReadVariableOpReadVariableOp+net_dense_2_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
net/dense_2/BiasAddBiasAddnet/dense_2/MatMul:product:0*net/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????i
net/dense_2/ReluRelunet/dense_2/BiasAdd:output:0*
T0*(
_output_shapes
:???????????
!net/dense_3/MatMul/ReadVariableOpReadVariableOp*net_dense_3_matmul_readvariableop_resource*
_output_shapes
:	?*
dtype0?
net/dense_3/MatMulMatMulnet/dense_2/Relu:activations:0)net/dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
"net/dense_3/BiasAdd/ReadVariableOpReadVariableOp+net_dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
net/dense_3/BiasAddBiasAddnet/dense_3/MatMul:product:0*net/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????n
net/dense_3/SigmoidSigmoidnet/dense_3/BiasAdd:output:0*
T0*'
_output_shapes
:?????????f
IdentityIdentitynet/dense_3/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp%^net/cheb_conv/BiasAdd/ReadVariableOp^net/cheb_conv/ReadVariableOp^net/cheb_conv/ReadVariableOp_1!^net/dense/BiasAdd/ReadVariableOp ^net/dense/MatMul/ReadVariableOp#^net/dense_1/BiasAdd/ReadVariableOp"^net/dense_1/MatMul/ReadVariableOp#^net/dense_2/BiasAdd/ReadVariableOp"^net/dense_2/MatMul/ReadVariableOp#^net/dense_3/BiasAdd/ReadVariableOp"^net/dense_3/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*q
_input_shapes`
^:?????????:?????????:?????????::?????????: : : : : : : : : : 2L
$net/cheb_conv/BiasAdd/ReadVariableOp$net/cheb_conv/BiasAdd/ReadVariableOp2<
net/cheb_conv/ReadVariableOpnet/cheb_conv/ReadVariableOp2@
net/cheb_conv/ReadVariableOp_1net/cheb_conv/ReadVariableOp_12D
 net/dense/BiasAdd/ReadVariableOp net/dense/BiasAdd/ReadVariableOp2B
net/dense/MatMul/ReadVariableOpnet/dense/MatMul/ReadVariableOp2H
"net/dense_1/BiasAdd/ReadVariableOp"net/dense_1/BiasAdd/ReadVariableOp2F
!net/dense_1/MatMul/ReadVariableOp!net/dense_1/MatMul/ReadVariableOp2H
"net/dense_2/BiasAdd/ReadVariableOp"net/dense_2/BiasAdd/ReadVariableOp2F
!net/dense_2/MatMul/ReadVariableOp!net/dense_2/MatMul/ReadVariableOp2H
"net/dense_3/BiasAdd/ReadVariableOp"net/dense_3/BiasAdd/ReadVariableOp2F
!net/dense_3/MatMul/ReadVariableOp!net/dense_3/MatMul/ReadVariableOp:O K
'
_output_shapes
:?????????
 
_user_specified_nameargs_0:OK
'
_output_shapes
:?????????
 
_user_specified_nameargs_0:KG
#
_output_shapes
:?????????
 
_user_specified_nameargs_0:B>

_output_shapes
:
 
_user_specified_nameargs_0:KG
#
_output_shapes
:?????????
 
_user_specified_nameargs_0
?!
?
E__inference_cheb_conv_layer_call_and_return_conditional_losses_449272
inputs_0

inputs	
inputs_1
inputs_2	-
readvariableop_resource: -
biasadd_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?ReadVariableOp?ReadVariableOp_1?6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOpj
ReadVariableOpReadVariableOpreadvariableop_resource*"
_output_shapes
: *
dtype0]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
strided_sliceStridedSliceReadVariableOp:value:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes

: *
shrink_axis_maskd
MatMulMatMulinputs_0strided_slice:output:0*
T0*'
_output_shapes
:????????? ?
/SparseTensorDenseMatMul/SparseTensorDenseMatMulSparseTensorDenseMatMulinputsinputs_1inputs_2inputs_0*
T0*'
_output_shapes
:?????????l
ReadVariableOp_1ReadVariableOpreadvariableop_resource*"
_output_shapes
: *
dtype0_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
strided_slice_1StridedSliceReadVariableOp_1:value:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

: *
shrink_axis_mask?
MatMul_1MatMul9SparseTensorDenseMatMul/SparseTensorDenseMatMul:product:0strided_slice_1:output:0*
T0*'
_output_shapes
:????????? d
addAddV2MatMul:product:0MatMul_1:product:0*
T0*'
_output_shapes
:????????? r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0m
BiasAddBiasAddadd:z:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? N
EluEluBiasAdd:output:0*
T0*'
_output_shapes
:????????? ?
6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOpreadvariableop_resource*"
_output_shapes
: *
dtype0?
'net/cheb_conv/kernel/Regularizer/SquareSquare>net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
: {
&net/cheb_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          ?
$net/cheb_conv/kernel/Regularizer/SumSum+net/cheb_conv/kernel/Regularizer/Square:y:0/net/cheb_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: k
&net/cheb_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
$net/cheb_conv/kernel/Regularizer/mulMul/net/cheb_conv/kernel/Regularizer/mul/x:output:0-net/cheb_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: `
IdentityIdentityElu:activations:0^NoOp*
T0*'
_output_shapes
:????????? ?
NoOpNoOp^BiasAdd/ReadVariableOp^ReadVariableOp^ReadVariableOp_17^net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*R
_input_shapesA
?:?????????:?????????:?????????:: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_12p
6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs
?	
b
C__inference_dropout_layer_call_and_return_conditional_losses_449299

inputs
identity?R
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:??????????C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:??????????*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ??
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:??????????p
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:??????????j
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:??????????Z
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:??????????:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?{
?

?__inference_net_layer_call_and_return_conditional_losses_449108
inputs_0

inputs	
inputs_1
inputs_2	

inputs_2_0	7
!cheb_conv_readvariableop_resource: 7
)cheb_conv_biasadd_readvariableop_resource: 8
$dense_matmul_readvariableop_resource:
?2?4
%dense_biasadd_readvariableop_resource:	?:
&dense_1_matmul_readvariableop_resource:
??6
'dense_1_biasadd_readvariableop_resource:	?:
&dense_2_matmul_readvariableop_resource:
??6
'dense_2_biasadd_readvariableop_resource:	?9
&dense_3_matmul_readvariableop_resource:	?5
'dense_3_biasadd_readvariableop_resource:
identity?? cheb_conv/BiasAdd/ReadVariableOp?cheb_conv/ReadVariableOp?cheb_conv/ReadVariableOp_1?dense/BiasAdd/ReadVariableOp?dense/MatMul/ReadVariableOp?dense_1/BiasAdd/ReadVariableOp?dense_1/MatMul/ReadVariableOp?dense_2/BiasAdd/ReadVariableOp?dense_2/MatMul/ReadVariableOp?dense_3/BiasAdd/ReadVariableOp?dense_3/MatMul/ReadVariableOp?6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp?2net/dense/kernel/Regularizer/Square/ReadVariableOp?4net/dense_1/kernel/Regularizer/Square/ReadVariableOp?4net/dense_2/kernel/Regularizer/Square/ReadVariableOp?4net/dense_3/kernel/Regularizer/Square/ReadVariableOpW
CastCastinputs_0*

DstT0*

SrcT0*'
_output_shapes
:?????????a
cheb_conv/CastCastCast:y:0*

DstT0*

SrcT0*'
_output_shapes
:?????????~
cheb_conv/ReadVariableOpReadVariableOp!cheb_conv_readvariableop_resource*"
_output_shapes
: *
dtype0g
cheb_conv/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: i
cheb_conv/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:i
cheb_conv/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
cheb_conv/strided_sliceStridedSlice cheb_conv/ReadVariableOp:value:0&cheb_conv/strided_slice/stack:output:0(cheb_conv/strided_slice/stack_1:output:0(cheb_conv/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes

: *
shrink_axis_mask?
cheb_conv/MatMulMatMulcheb_conv/Cast:y:0 cheb_conv/strided_slice:output:0*
T0*'
_output_shapes
:????????? ?
9cheb_conv/SparseTensorDenseMatMul/SparseTensorDenseMatMulSparseTensorDenseMatMulinputsinputs_1inputs_2cheb_conv/Cast:y:0*
T0*'
_output_shapes
:??????????
cheb_conv/ReadVariableOp_1ReadVariableOp!cheb_conv_readvariableop_resource*"
_output_shapes
: *
dtype0i
cheb_conv/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB:k
!cheb_conv/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:k
!cheb_conv/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
cheb_conv/strided_slice_1StridedSlice"cheb_conv/ReadVariableOp_1:value:0(cheb_conv/strided_slice_1/stack:output:0*cheb_conv/strided_slice_1/stack_1:output:0*cheb_conv/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes

: *
shrink_axis_mask?
cheb_conv/MatMul_1MatMulCcheb_conv/SparseTensorDenseMatMul/SparseTensorDenseMatMul:product:0"cheb_conv/strided_slice_1:output:0*
T0*'
_output_shapes
:????????? ?
cheb_conv/addAddV2cheb_conv/MatMul:product:0cheb_conv/MatMul_1:product:0*
T0*'
_output_shapes
:????????? ?
 cheb_conv/BiasAdd/ReadVariableOpReadVariableOp)cheb_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0?
cheb_conv/BiasAddBiasAddcheb_conv/add:z:0(cheb_conv/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? b
cheb_conv/EluElucheb_conv/BiasAdd:output:0*
T0*'
_output_shapes
:????????? P
ShapeShapecheb_conv/Elu:activations:0*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskL
	truediv/yConst*
_output_shapes
: *
dtype0*
value
B :?\
truediv/CastCaststrided_slice:output:0*

DstT0*

SrcT0*
_output_shapes
: Z
truediv/Cast_1Casttruediv/y:output:0*

DstT0*

SrcT0*
_output_shapes
: Y
truedivRealDivtruediv/Cast:y:0truediv/Cast_1:y:0*
T0*
_output_shapes
: X
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
valueB 2      i@X
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
valueB 2      @@?
Reshape/shapePacktruediv:z:0Reshape/shape/1:output:0Reshape/shape/2:output:0*
N*
T0*
_output_shapes
:Q
Reshape/CastCasttruediv:z:0*

DstT0*

SrcT0*
_output_shapes
: T
Reshape/shape_1/1Const*
_output_shapes
: *
dtype0*
value
B :?S
Reshape/shape_1/2Const*
_output_shapes
: *
dtype0*
value	B : ?
Reshape/shape_1PackReshape/Cast:y:0Reshape/shape_1/1:output:0Reshape/shape_1/2:output:0*
N*
T0*
_output_shapes
:?
ReshapeReshapecheb_conv/Elu:activations:0Reshape/shape_1:output:0*
T0*,
_output_shapes
:?????????? ^
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"????   w
flatten/ReshapeReshapeReshape:output:0flatten/Const:output:0*
T0*(
_output_shapes
:??????????2?
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource* 
_output_shapes
:
?2?*
dtype0?
dense/MatMulMatMulflatten/Reshape:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????]

dense/ReluReludense/BiasAdd:output:0*
T0*(
_output_shapes
:???????????
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
dense_1/MatMulMatMuldense/Relu:activations:0%dense_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????a
dense_1/ReluReludense_1/BiasAdd:output:0*
T0*(
_output_shapes
:??????????k
dropout/IdentityIdentitydense_1/Relu:activations:0*
T0*(
_output_shapes
:???????????
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
dense_2/MatMulMatMuldropout/Identity:output:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????a
dense_2/ReluReludense_2/BiasAdd:output:0*
T0*(
_output_shapes
:???????????
dense_3/MatMul/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource*
_output_shapes
:	?*
dtype0?
dense_3/MatMulMatMuldense_2/Relu:activations:0%dense_3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
dense_3/BiasAddBiasAdddense_3/MatMul:product:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????f
dense_3/SigmoidSigmoiddense_3/BiasAdd:output:0*
T0*'
_output_shapes
:??????????
6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOp!cheb_conv_readvariableop_resource*"
_output_shapes
: *
dtype0?
'net/cheb_conv/kernel/Regularizer/SquareSquare>net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
: {
&net/cheb_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          ?
$net/cheb_conv/kernel/Regularizer/SumSum+net/cheb_conv/kernel/Regularizer/Square:y:0/net/cheb_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: k
&net/cheb_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
$net/cheb_conv/kernel/Regularizer/mulMul/net/cheb_conv/kernel/Regularizer/mul/x:output:0-net/cheb_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
2net/dense/kernel/Regularizer/Square/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource* 
_output_shapes
:
?2?*
dtype0?
#net/dense/kernel/Regularizer/SquareSquare:net/dense/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
?2?s
"net/dense/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
 net/dense/kernel/Regularizer/SumSum'net/dense/kernel/Regularizer/Square:y:0+net/dense/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: g
"net/dense/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
 net/dense/kernel/Regularizer/mulMul+net/dense/kernel/Regularizer/mul/x:output:0)net/dense/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
4net/dense_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
%net/dense_1/kernel/Regularizer/SquareSquare<net/dense_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
$net/dense_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_1/kernel/Regularizer/SumSum)net/dense_1/kernel/Regularizer/Square:y:0-net/dense_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_1/kernel/Regularizer/mulMul-net/dense_1/kernel/Regularizer/mul/x:output:0+net/dense_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
4net/dense_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
%net/dense_2/kernel/Regularizer/SquareSquare<net/dense_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
$net/dense_2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_2/kernel/Regularizer/SumSum)net/dense_2/kernel/Regularizer/Square:y:0-net/dense_2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_2/kernel/Regularizer/mulMul-net/dense_2/kernel/Regularizer/mul/x:output:0+net/dense_2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
4net/dense_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOp&dense_3_matmul_readvariableop_resource*
_output_shapes
:	?*
dtype0?
%net/dense_3/kernel/Regularizer/SquareSquare<net/dense_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?u
$net/dense_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_3/kernel/Regularizer/SumSum)net/dense_3/kernel/Regularizer/Square:y:0-net/dense_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_3/kernel/Regularizer/mulMul-net/dense_3/kernel/Regularizer/mul/x:output:0+net/dense_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentitydense_3/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp!^cheb_conv/BiasAdd/ReadVariableOp^cheb_conv/ReadVariableOp^cheb_conv/ReadVariableOp_1^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp^dense_1/BiasAdd/ReadVariableOp^dense_1/MatMul/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp^dense_3/BiasAdd/ReadVariableOp^dense_3/MatMul/ReadVariableOp7^net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp3^net/dense/kernel/Regularizer/Square/ReadVariableOp5^net/dense_1/kernel/Regularizer/Square/ReadVariableOp5^net/dense_2/kernel/Regularizer/Square/ReadVariableOp5^net/dense_3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*q
_input_shapes`
^:?????????:?????????:?????????::?????????: : : : : : : : : : 2D
 cheb_conv/BiasAdd/ReadVariableOp cheb_conv/BiasAdd/ReadVariableOp24
cheb_conv/ReadVariableOpcheb_conv/ReadVariableOp28
cheb_conv/ReadVariableOp_1cheb_conv/ReadVariableOp_12<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2>
dense_3/MatMul/ReadVariableOpdense_3/MatMul/ReadVariableOp2p
6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp2h
2net/dense/kernel/Regularizer/Square/ReadVariableOp2net/dense/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_1/kernel/Regularizer/Square/ReadVariableOp4net/dense_1/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_2/kernel/Regularizer/Square/ReadVariableOp4net/dense_2/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_3/kernel/Regularizer/Square/ReadVariableOp4net/dense_3/kernel/Regularizer/Square/ReadVariableOp:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs:MI
#
_output_shapes
:?????????
"
_user_specified_name
inputs/2
?
?
C__inference_dense_3_layer_call_and_return_conditional_losses_448401

inputs1
matmul_readvariableop_resource:	?-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?4net/dense_3/kernel/Regularizer/Square/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????V
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:??????????
4net/dense_3/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?*
dtype0?
%net/dense_3/kernel/Regularizer/SquareSquare<net/dense_3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?u
$net/dense_3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_3/kernel/Regularizer/SumSum)net/dense_3/kernel/Regularizer/Square:y:0-net/dense_3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_3/kernel/Regularizer/mulMul-net/dense_3/kernel/Regularizer/mul/x:output:0+net/dense_3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp5^net/dense_3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2l
4net/dense_3/kernel/Regularizer/Square/ReadVariableOp4net/dense_3/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
C__inference_dense_1_layer_call_and_return_conditional_losses_448348

inputs2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?4net/dense_1/kernel/Regularizer/Square/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????Q
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:???????????
4net/dense_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
%net/dense_1/kernel/Regularizer/SquareSquare<net/dense_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
$net/dense_1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
"net/dense_1/kernel/Regularizer/SumSum)net/dense_1/kernel/Regularizer/Square:y:0-net/dense_1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: i
$net/dense_1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
"net/dense_1/kernel/Regularizer/mulMul-net/dense_1/kernel/Regularizer/mul/x:output:0+net/dense_1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: b
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:???????????
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp5^net/dense_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2l
4net/dense_1/kernel/Regularizer/Square/ReadVariableOp4net/dense_1/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
$__inference_net_layer_call_fn_449001
inputs_0

inputs	
inputs_1
inputs_2	

inputs_2_0	
unknown: 
	unknown_0: 
	unknown_1:
?2?
	unknown_2:	?
	unknown_3:
??
	unknown_4:	?
	unknown_5:
??
	unknown_6:	?
	unknown_7:	?
	unknown_8:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputsinputs_1inputs_2
inputs_2_0unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2			*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*,
_read_only_resource_inputs

	
*0
config_proto 

CPU

GPU2*0J 8? *H
fCRA
?__inference_net_layer_call_and_return_conditional_losses_448662o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*q
_input_shapes`
^:?????????:?????????:?????????::?????????: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs:MI
#
_output_shapes
:?????????
"
_user_specified_name
inputs/2
?
?
$__inference_net_layer_call_fn_448972
inputs_0

inputs	
inputs_1
inputs_2	

inputs_2_0	
unknown: 
	unknown_0: 
	unknown_1:
?2?
	unknown_2:	?
	unknown_3:
??
	unknown_4:	?
	unknown_5:
??
	unknown_6:	?
	unknown_7:	?
	unknown_8:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputsinputs_1inputs_2
inputs_2_0unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2			*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*,
_read_only_resource_inputs

	
*0
config_proto 

CPU

GPU2*0J 8? *H
fCRA
?__inference_net_layer_call_and_return_conditional_losses_448438o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*q
_input_shapes`
^:?????????:?????????:?????????::?????????: : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
'
_output_shapes
:?????????
"
_user_specified_name
inputs/0:OK
'
_output_shapes
:?????????
 
_user_specified_nameinputs:KG
#
_output_shapes
:?????????
 
_user_specified_nameinputs:B>

_output_shapes
:
 
_user_specified_nameinputs:MI
#
_output_shapes
:?????????
"
_user_specified_name
inputs/2
?	
b
C__inference_dropout_layer_call_and_return_conditional_losses_448501

inputs
identity?R
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:??????????C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:??????????*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ??
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:??????????p
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:??????????j
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:??????????Z
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:??????????:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
__inference_loss_fn_0_449449U
?net_cheb_conv_kernel_regularizer_square_readvariableop_resource: 
identity??6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp?
6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOp?net_cheb_conv_kernel_regularizer_square_readvariableop_resource*"
_output_shapes
: *
dtype0?
'net/cheb_conv/kernel/Regularizer/SquareSquare>net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*"
_output_shapes
: {
&net/cheb_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*!
valueB"          ?
$net/cheb_conv/kernel/Regularizer/SumSum+net/cheb_conv/kernel/Regularizer/Square:y:0/net/cheb_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: k
&net/cheb_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
$net/cheb_conv/kernel/Regularizer/mulMul/net/cheb_conv/kernel/Regularizer/mul/x:output:0-net/cheb_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: f
IdentityIdentity(net/cheb_conv/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: 
NoOpNoOp7^net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2p
6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp6net/cheb_conv/kernel/Regularizer/Square/ReadVariableOp
?
a
C__inference_dropout_layer_call_and_return_conditional_losses_449287

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:??????????\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:??????????"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:??????????:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs"?L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*?
serving_default?
9
args_0/
serving_default_args_0:0?????????
=
args_0_11
serving_default_args_0_1:0	?????????
9
args_0_2-
serving_default_args_0_2:0?????????
0
args_0_3$
serving_default_args_0_3:0	
9
args_0_4-
serving_default_args_0_4:0	?????????<
output_10
StatefulPartitionedCall:0?????????tensorflow/serving/predict:??
?
conv
dropout
flatten

dense1

dense2

dense3

dense4
	variables
	trainable_variables

regularization_losses
	keras_api

signatures
\__call__
*]&call_and_return_all_conditional_losses
^_default_save_signature"
_tf_keras_model
?
kwargs_keys

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
___call__
*`&call_and_return_all_conditional_losses"
_tf_keras_layer
?
	variables
trainable_variables
regularization_losses
	keras_api
a__call__
*b&call_and_return_all_conditional_losses"
_tf_keras_layer
?
	variables
trainable_variables
regularization_losses
	keras_api
c__call__
*d&call_and_return_all_conditional_losses"
_tf_keras_layer
?

kernel
bias
	variables
trainable_variables
 regularization_losses
!	keras_api
e__call__
*f&call_and_return_all_conditional_losses"
_tf_keras_layer
?

"kernel
#bias
$	variables
%trainable_variables
&regularization_losses
'	keras_api
g__call__
*h&call_and_return_all_conditional_losses"
_tf_keras_layer
?

(kernel
)bias
*	variables
+trainable_variables
,regularization_losses
-	keras_api
i__call__
*j&call_and_return_all_conditional_losses"
_tf_keras_layer
?

.kernel
/bias
0	variables
1trainable_variables
2regularization_losses
3	keras_api
k__call__
*l&call_and_return_all_conditional_losses"
_tf_keras_layer
f
0
1
2
3
"4
#5
(6
)7
.8
/9"
trackable_list_wrapper
f
0
1
2
3
"4
#5
(6
)7
.8
/9"
trackable_list_wrapper
C
m0
n1
o2
p3
q4"
trackable_list_wrapper
?
4non_trainable_variables

5layers
6metrics
7layer_regularization_losses
8layer_metrics
	variables
	trainable_variables

regularization_losses
\__call__
^_default_save_signature
*]&call_and_return_all_conditional_losses
&]"call_and_return_conditional_losses"
_generic_user_object
,
rserving_default"
signature_map
 "
trackable_list_wrapper
*:( 2net/cheb_conv/kernel
 : 2net/cheb_conv/bias
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
'
m0"
trackable_list_wrapper
?
9non_trainable_variables

:layers
;metrics
<layer_regularization_losses
=layer_metrics
	variables
trainable_variables
regularization_losses
___call__
*`&call_and_return_all_conditional_losses
&`"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
>non_trainable_variables

?layers
@metrics
Alayer_regularization_losses
Blayer_metrics
	variables
trainable_variables
regularization_losses
a__call__
*b&call_and_return_all_conditional_losses
&b"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
Cnon_trainable_variables

Dlayers
Emetrics
Flayer_regularization_losses
Glayer_metrics
	variables
trainable_variables
regularization_losses
c__call__
*d&call_and_return_all_conditional_losses
&d"call_and_return_conditional_losses"
_generic_user_object
$:"
?2?2net/dense/kernel
:?2net/dense/bias
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
'
n0"
trackable_list_wrapper
?
Hnon_trainable_variables

Ilayers
Jmetrics
Klayer_regularization_losses
Llayer_metrics
	variables
trainable_variables
 regularization_losses
e__call__
*f&call_and_return_all_conditional_losses
&f"call_and_return_conditional_losses"
_generic_user_object
&:$
??2net/dense_1/kernel
:?2net/dense_1/bias
.
"0
#1"
trackable_list_wrapper
.
"0
#1"
trackable_list_wrapper
'
o0"
trackable_list_wrapper
?
Mnon_trainable_variables

Nlayers
Ometrics
Player_regularization_losses
Qlayer_metrics
$	variables
%trainable_variables
&regularization_losses
g__call__
*h&call_and_return_all_conditional_losses
&h"call_and_return_conditional_losses"
_generic_user_object
&:$
??2net/dense_2/kernel
:?2net/dense_2/bias
.
(0
)1"
trackable_list_wrapper
.
(0
)1"
trackable_list_wrapper
'
p0"
trackable_list_wrapper
?
Rnon_trainable_variables

Slayers
Tmetrics
Ulayer_regularization_losses
Vlayer_metrics
*	variables
+trainable_variables
,regularization_losses
i__call__
*j&call_and_return_all_conditional_losses
&j"call_and_return_conditional_losses"
_generic_user_object
%:#	?2net/dense_3/kernel
:2net/dense_3/bias
.
.0
/1"
trackable_list_wrapper
.
.0
/1"
trackable_list_wrapper
'
q0"
trackable_list_wrapper
?
Wnon_trainable_variables

Xlayers
Ymetrics
Zlayer_regularization_losses
[layer_metrics
0	variables
1trainable_variables
2regularization_losses
k__call__
*l&call_and_return_all_conditional_losses
&l"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
Q
0
1
2
3
4
5
6"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
m0"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
n0"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
o0"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
p0"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
q0"
trackable_list_wrapper
 "
trackable_dict_wrapper
?2?
$__inference_net_layer_call_fn_448972
$__inference_net_layer_call_fn_449001?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
?__inference_net_layer_call_and_return_conditional_losses_449108
?__inference_net_layer_call_and_return_conditional_losses_449222?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?B?
!__inference__wrapped_model_448228args_0args_0_1args_0_2args_0_3args_0_4"?
???
FullArgSpec
args? 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
*__inference_cheb_conv_layer_call_fn_449240?
???
FullArgSpec
args?

jinputs
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
E__inference_cheb_conv_layer_call_and_return_conditional_losses_449272?
???
FullArgSpec
args?

jinputs
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
(__inference_dropout_layer_call_fn_449277
(__inference_dropout_layer_call_fn_449282?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
C__inference_dropout_layer_call_and_return_conditional_losses_449287
C__inference_dropout_layer_call_and_return_conditional_losses_449299?
???
FullArgSpec)
args!?
jself
jinputs

jtraining
varargs
 
varkw
 
defaults?
p 

kwonlyargs? 
kwonlydefaults? 
annotations? *
 
?2?
(__inference_flatten_layer_call_fn_449304?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
C__inference_flatten_layer_call_and_return_conditional_losses_449310?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
&__inference_dense_layer_call_fn_449325?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
A__inference_dense_layer_call_and_return_conditional_losses_449342?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
(__inference_dense_1_layer_call_fn_449357?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
C__inference_dense_1_layer_call_and_return_conditional_losses_449374?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
(__inference_dense_2_layer_call_fn_449389?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
C__inference_dense_2_layer_call_and_return_conditional_losses_449406?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
(__inference_dense_3_layer_call_fn_449421?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
C__inference_dense_3_layer_call_and_return_conditional_losses_449438?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 
?2?
__inference_loss_fn_0_449449?
???
FullArgSpec
args? 
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *? 
?2?
__inference_loss_fn_1_449460?
???
FullArgSpec
args? 
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *? 
?2?
__inference_loss_fn_2_449471?
???
FullArgSpec
args? 
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *? 
?2?
__inference_loss_fn_3_449482?
???
FullArgSpec
args? 
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *? 
?2?
__inference_loss_fn_4_449493?
???
FullArgSpec
args? 
varargs
 
varkw
 
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *? 
?B?
$__inference_signature_wrapper_448943args_0args_0_1args_0_2args_0_3args_0_4"?
???
FullArgSpec
args? 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs? 
kwonlydefaults
 
annotations? *
 ?
!__inference__wrapped_model_448228?
"#()./???
???
???
"?
args_0/0?????????
B??'?$
???????????????????
?SparseTensorSpec 
?
args_0/2?????????	
? "3?0
.
output_1"?
output_1??????????
E__inference_cheb_conv_layer_call_and_return_conditional_losses_449272?z?w
p?m
k?h
"?
inputs/0?????????
B??'?$
???????????????????
?SparseTensorSpec 
? "%?"
?
0????????? 
? ?
*__inference_cheb_conv_layer_call_fn_449240?z?w
p?m
k?h
"?
inputs/0?????????
B??'?$
???????????????????
?SparseTensorSpec 
? "?????????? ?
C__inference_dense_1_layer_call_and_return_conditional_losses_449374^"#0?-
&?#
!?
inputs??????????
? "&?#
?
0??????????
? }
(__inference_dense_1_layer_call_fn_449357Q"#0?-
&?#
!?
inputs??????????
? "????????????
C__inference_dense_2_layer_call_and_return_conditional_losses_449406^()0?-
&?#
!?
inputs??????????
? "&?#
?
0??????????
? }
(__inference_dense_2_layer_call_fn_449389Q()0?-
&?#
!?
inputs??????????
? "????????????
C__inference_dense_3_layer_call_and_return_conditional_losses_449438]./0?-
&?#
!?
inputs??????????
? "%?"
?
0?????????
? |
(__inference_dense_3_layer_call_fn_449421P./0?-
&?#
!?
inputs??????????
? "???????????
A__inference_dense_layer_call_and_return_conditional_losses_449342^0?-
&?#
!?
inputs??????????2
? "&?#
?
0??????????
? {
&__inference_dense_layer_call_fn_449325Q0?-
&?#
!?
inputs??????????2
? "????????????
C__inference_dropout_layer_call_and_return_conditional_losses_449287^4?1
*?'
!?
inputs??????????
p 
? "&?#
?
0??????????
? ?
C__inference_dropout_layer_call_and_return_conditional_losses_449299^4?1
*?'
!?
inputs??????????
p
? "&?#
?
0??????????
? }
(__inference_dropout_layer_call_fn_449277Q4?1
*?'
!?
inputs??????????
p 
? "???????????}
(__inference_dropout_layer_call_fn_449282Q4?1
*?'
!?
inputs??????????
p
? "????????????
C__inference_flatten_layer_call_and_return_conditional_losses_449310^4?1
*?'
%?"
inputs?????????? 
? "&?#
?
0??????????2
? }
(__inference_flatten_layer_call_fn_449304Q4?1
*?'
%?"
inputs?????????? 
? "???????????2;
__inference_loss_fn_0_449449?

? 
? "? ;
__inference_loss_fn_1_449460?

? 
? "? ;
__inference_loss_fn_2_449471"?

? 
? "? ;
__inference_loss_fn_3_449482(?

? 
? "? ;
__inference_loss_fn_4_449493.?

? 
? "? ?
?__inference_net_layer_call_and_return_conditional_losses_449108?
"#()./???
???
???
"?
inputs/0?????????
B??'?$
???????????????????
?SparseTensorSpec 
?
inputs/2?????????	
p 
? "%?"
?
0?????????
? ?
?__inference_net_layer_call_and_return_conditional_losses_449222?
"#()./???
???
???
"?
inputs/0?????????
B??'?$
???????????????????
?SparseTensorSpec 
?
inputs/2?????????	
p
? "%?"
?
0?????????
? ?
$__inference_net_layer_call_fn_448972?
"#()./???
???
???
"?
inputs/0?????????
B??'?$
???????????????????
?SparseTensorSpec 
?
inputs/2?????????	
p 
? "???????????
$__inference_net_layer_call_fn_449001?
"#()./???
???
???
"?
inputs/0?????????
B??'?$
???????????????????
?SparseTensorSpec 
?
inputs/2?????????	
p
? "???????????
$__inference_signature_wrapper_448943?
"#()./???
? 
???
*
args_0 ?
args_0?????????
.
args_0_1"?
args_0_1?????????	
*
args_0_2?
args_0_2?????????
!
args_0_3?
args_0_3	
*
args_0_4?
args_0_4?????????	"3?0
.
output_1"?
output_1?????????