??
??
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
?
GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"

batch_dimsint "
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
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
?
Mul
x"T
y"T
z"T"
Ttype:
2	?
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
.
Rsqrt
x"T
y"T"
Ttype:

2
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
<
Sub
x"T
y"T
z"T"
Ttype:
2	
?
UnsortedSegmentSum	
data"T
segment_ids"Tindices
num_segments"Tnumsegments
output"T" 
Ttype:
2	"
Tindicestype:
2	" 
Tnumsegmentstype0:
2	
?
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 ?"serve*2.7.12v2.7.0-217-g2a0f59ecfe68??
?
net/general_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *(
shared_namenet/general_conv/kernel
?
+net/general_conv/kernel/Read/ReadVariableOpReadVariableOpnet/general_conv/kernel*
_output_shapes

: *
dtype0
?
net/general_conv/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *&
shared_namenet/general_conv/bias
{
)net/general_conv/bias/Read/ReadVariableOpReadVariableOpnet/general_conv/bias*
_output_shapes
: *
dtype0
~
net/dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??*!
shared_namenet/dense/kernel
w
$net/dense/kernel/Read/ReadVariableOpReadVariableOpnet/dense/kernel* 
_output_shapes
:
??*
dtype0
u
net/dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*
shared_namenet/dense/bias
n
"net/dense/bias/Read/ReadVariableOpReadVariableOpnet/dense/bias*
_output_shapes	
:?*
dtype0
?
net/dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
??*#
shared_namenet/dense_1/kernel
{
&net/dense_1/kernel/Read/ReadVariableOpReadVariableOpnet/dense_1/kernel* 
_output_shapes
:
??*
dtype0
y
net/dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:?*!
shared_namenet/dense_1/bias
r
$net/dense_1/bias/Read/ReadVariableOpReadVariableOpnet/dense_1/bias*
_output_shapes	
:?*
dtype0
?
net/dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	?*#
shared_namenet/dense_2/kernel
z
&net/dense_2/kernel/Read/ReadVariableOpReadVariableOpnet/dense_2/kernel*
_output_shapes
:	?*
dtype0
x
net/dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*!
shared_namenet/dense_2/bias
q
$net/dense_2/bias/Read/ReadVariableOpReadVariableOpnet/dense_2/bias*
_output_shapes
:*
dtype0
?
*net/general_conv/batch_normalization/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *;
shared_name,*net/general_conv/batch_normalization/gamma
?
>net/general_conv/batch_normalization/gamma/Read/ReadVariableOpReadVariableOp*net/general_conv/batch_normalization/gamma*
_output_shapes
: *
dtype0
?
)net/general_conv/batch_normalization/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape: *:
shared_name+)net/general_conv/batch_normalization/beta
?
=net/general_conv/batch_normalization/beta/Read/ReadVariableOpReadVariableOp)net/general_conv/batch_normalization/beta*
_output_shapes
: *
dtype0
?
0net/general_conv/batch_normalization/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape: *A
shared_name20net/general_conv/batch_normalization/moving_mean
?
Dnet/general_conv/batch_normalization/moving_mean/Read/ReadVariableOpReadVariableOp0net/general_conv/batch_normalization/moving_mean*
_output_shapes
: *
dtype0
?
4net/general_conv/batch_normalization/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape: *E
shared_name64net/general_conv/batch_normalization/moving_variance
?
Hnet/general_conv/batch_normalization/moving_variance/Read/ReadVariableOpReadVariableOp4net/general_conv/batch_normalization/moving_variance*
_output_shapes
: *
dtype0

NoOpNoOp
?"
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*?"
value?"B?" B?"
?
	conv1
	conv2
dropout
flatten

dense1

dense2

dense3
	variables
	trainable_variables

regularization_losses
	keras_api

signatures
?
kwargs_keys
dropout

batch_norm

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
 
kwargs_keys
	keras_api
R
	variables
trainable_variables
regularization_losses
	keras_api
R
	variables
trainable_variables
regularization_losses
	keras_api
h

 kernel
!bias
"	variables
#trainable_variables
$regularization_losses
%	keras_api
h

&kernel
'bias
(	variables
)trainable_variables
*regularization_losses
+	keras_api
h

,kernel
-bias
.	variables
/trainable_variables
0regularization_losses
1	keras_api
V
0
1
22
33
44
55
 6
!7
&8
'9
,10
-11
F
0
1
22
33
 4
!5
&6
'7
,8
-9
 
?
6non_trainable_variables

7layers
8metrics
9layer_regularization_losses
:layer_metrics
	variables
	trainable_variables

regularization_losses
 
 
R
;	variables
<trainable_variables
=regularization_losses
>	keras_api
?
?axis
	2gamma
3beta
4moving_mean
5moving_variance
@	variables
Atrainable_variables
Bregularization_losses
C	keras_api
TR
VARIABLE_VALUEnet/general_conv/kernel'conv1/kernel/.ATTRIBUTES/VARIABLE_VALUE
PN
VARIABLE_VALUEnet/general_conv/bias%conv1/bias/.ATTRIBUTES/VARIABLE_VALUE
*
0
1
22
33
44
55

0
1
22
33
 
?
Dnon_trainable_variables

Elayers
Fmetrics
Glayer_regularization_losses
Hlayer_metrics
	variables
trainable_variables
regularization_losses
 
 
 
 
 
?
Inon_trainable_variables

Jlayers
Kmetrics
Llayer_regularization_losses
Mlayer_metrics
	variables
trainable_variables
regularization_losses
 
 
 
?
Nnon_trainable_variables

Olayers
Pmetrics
Qlayer_regularization_losses
Rlayer_metrics
	variables
trainable_variables
regularization_losses
NL
VARIABLE_VALUEnet/dense/kernel(dense1/kernel/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUEnet/dense/bias&dense1/bias/.ATTRIBUTES/VARIABLE_VALUE

 0
!1

 0
!1
 
?
Snon_trainable_variables

Tlayers
Umetrics
Vlayer_regularization_losses
Wlayer_metrics
"	variables
#trainable_variables
$regularization_losses
PN
VARIABLE_VALUEnet/dense_1/kernel(dense2/kernel/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEnet/dense_1/bias&dense2/bias/.ATTRIBUTES/VARIABLE_VALUE

&0
'1

&0
'1
 
?
Xnon_trainable_variables

Ylayers
Zmetrics
[layer_regularization_losses
\layer_metrics
(	variables
)trainable_variables
*regularization_losses
PN
VARIABLE_VALUEnet/dense_2/kernel(dense3/kernel/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEnet/dense_2/bias&dense3/bias/.ATTRIBUTES/VARIABLE_VALUE

,0
-1

,0
-1
 
?
]non_trainable_variables

^layers
_metrics
`layer_regularization_losses
alayer_metrics
.	variables
/trainable_variables
0regularization_losses
fd
VARIABLE_VALUE*net/general_conv/batch_normalization/gamma&variables/2/.ATTRIBUTES/VARIABLE_VALUE
ec
VARIABLE_VALUE)net/general_conv/batch_normalization/beta&variables/3/.ATTRIBUTES/VARIABLE_VALUE
lj
VARIABLE_VALUE0net/general_conv/batch_normalization/moving_mean&variables/4/.ATTRIBUTES/VARIABLE_VALUE
pn
VARIABLE_VALUE4net/general_conv/batch_normalization/moving_variance&variables/5/.ATTRIBUTES/VARIABLE_VALUE

40
51
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
?
bnon_trainable_variables

clayers
dmetrics
elayer_regularization_losses
flayer_metrics
;	variables
<trainable_variables
=regularization_losses
 

20
31
42
53

20
31
 
?
gnon_trainable_variables

hlayers
imetrics
jlayer_regularization_losses
klayer_metrics
@	variables
Atrainable_variables
Bregularization_losses

40
51

0
1
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

40
51
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
?
StatefulPartitionedCallStatefulPartitionedCallserving_default_args_0serving_default_args_0_1serving_default_args_0_2serving_default_args_0_3serving_default_args_0_4net/general_conv/kernelnet/general_conv/bias4net/general_conv/batch_normalization/moving_variance*net/general_conv/batch_normalization/gamma0net/general_conv/batch_normalization/moving_mean)net/general_conv/batch_normalization/betanet/dense/kernelnet/dense/biasnet/dense_1/kernelnet/dense_1/biasnet/dense_2/kernelnet/dense_2/bias*
Tin
2			*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8? *.
f)R'
%__inference_signature_wrapper_6693891
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
?
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename+net/general_conv/kernel/Read/ReadVariableOp)net/general_conv/bias/Read/ReadVariableOp$net/dense/kernel/Read/ReadVariableOp"net/dense/bias/Read/ReadVariableOp&net/dense_1/kernel/Read/ReadVariableOp$net/dense_1/bias/Read/ReadVariableOp&net/dense_2/kernel/Read/ReadVariableOp$net/dense_2/bias/Read/ReadVariableOp>net/general_conv/batch_normalization/gamma/Read/ReadVariableOp=net/general_conv/batch_normalization/beta/Read/ReadVariableOpDnet/general_conv/batch_normalization/moving_mean/Read/ReadVariableOpHnet/general_conv/batch_normalization/moving_variance/Read/ReadVariableOpConst*
Tin
2*
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
GPU2*0J 8? *)
f$R"
 __inference__traced_save_6694693
?
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamenet/general_conv/kernelnet/general_conv/biasnet/dense/kernelnet/dense/biasnet/dense_1/kernelnet/dense_1/biasnet/dense_2/kernelnet/dense_2/bias*net/general_conv/batch_normalization/gamma)net/general_conv/batch_normalization/beta0net/general_conv/batch_normalization/moving_mean4net/general_conv/batch_normalization/moving_variance*
Tin
2*
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
GPU2*0J 8? *,
f'R%
#__inference__traced_restore_6694739??
?	
c
D__inference_dropout_layer_call_and_return_conditional_losses_6694399

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
:??????????C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:??????????*
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
:??????????p
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:??????????j
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:??????????Z
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:??????????:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
َ
?
@__inference_net_layer_call_and_return_conditional_losses_6694072
inputs_0

inputs	
inputs_1
inputs_2	

inputs_2_0	=
+general_conv_matmul_readvariableop_resource: :
,general_conv_biasadd_readvariableop_resource: P
Bgeneral_conv_batch_normalization_batchnorm_readvariableop_resource: T
Fgeneral_conv_batch_normalization_batchnorm_mul_readvariableop_resource: R
Dgeneral_conv_batch_normalization_batchnorm_readvariableop_1_resource: R
Dgeneral_conv_batch_normalization_batchnorm_readvariableop_2_resource: 8
$dense_matmul_readvariableop_resource:
??4
%dense_biasadd_readvariableop_resource:	?:
&dense_1_matmul_readvariableop_resource:
??6
'dense_1_biasadd_readvariableop_resource:	?9
&dense_2_matmul_readvariableop_resource:	?5
'dense_2_biasadd_readvariableop_resource:
identity??dense/BiasAdd/ReadVariableOp?dense/MatMul/ReadVariableOp?dense_1/BiasAdd/ReadVariableOp?dense_1/MatMul/ReadVariableOp?dense_2/BiasAdd/ReadVariableOp?dense_2/MatMul/ReadVariableOp?#general_conv/BiasAdd/ReadVariableOp?"general_conv/MatMul/ReadVariableOp?9general_conv/batch_normalization/batchnorm/ReadVariableOp?;general_conv/batch_normalization/batchnorm/ReadVariableOp_1?;general_conv/batch_normalization/batchnorm/ReadVariableOp_2?=general_conv/batch_normalization/batchnorm/mul/ReadVariableOp?2net/dense/kernel/Regularizer/Square/ReadVariableOp?4net/dense_1/kernel/Regularizer/Square/ReadVariableOp?4net/dense_2/kernel/Regularizer/Square/ReadVariableOp?9net/general_conv/kernel/Regularizer/Square/ReadVariableOpW
CastCastinputs_0*

DstT0*

SrcT0*'
_output_shapes
:?????????d
general_conv/CastCastCast:y:0*

DstT0*

SrcT0*'
_output_shapes
:??????????
"general_conv/MatMul/ReadVariableOpReadVariableOp+general_conv_matmul_readvariableop_resource*
_output_shapes

: *
dtype0?
general_conv/MatMulMatMulgeneral_conv/Cast:y:0*general_conv/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? ?
#general_conv/BiasAdd/ReadVariableOpReadVariableOp,general_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0?
general_conv/BiasAddBiasAddgeneral_conv/MatMul:product:0+general_conv/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? ?
9general_conv/batch_normalization/batchnorm/ReadVariableOpReadVariableOpBgeneral_conv_batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0u
0general_conv/batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o?:?
.general_conv/batch_normalization/batchnorm/addAddV2Ageneral_conv/batch_normalization/batchnorm/ReadVariableOp:value:09general_conv/batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes
: ?
0general_conv/batch_normalization/batchnorm/RsqrtRsqrt2general_conv/batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes
: ?
=general_conv/batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOpFgeneral_conv_batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0?
.general_conv/batch_normalization/batchnorm/mulMul4general_conv/batch_normalization/batchnorm/Rsqrt:y:0Egeneral_conv/batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
: ?
0general_conv/batch_normalization/batchnorm/mul_1Mulgeneral_conv/BiasAdd:output:02general_conv/batch_normalization/batchnorm/mul:z:0*
T0*'
_output_shapes
:????????? ?
;general_conv/batch_normalization/batchnorm/ReadVariableOp_1ReadVariableOpDgeneral_conv_batch_normalization_batchnorm_readvariableop_1_resource*
_output_shapes
: *
dtype0?
0general_conv/batch_normalization/batchnorm/mul_2MulCgeneral_conv/batch_normalization/batchnorm/ReadVariableOp_1:value:02general_conv/batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes
: ?
;general_conv/batch_normalization/batchnorm/ReadVariableOp_2ReadVariableOpDgeneral_conv_batch_normalization_batchnorm_readvariableop_2_resource*
_output_shapes
: *
dtype0?
.general_conv/batch_normalization/batchnorm/subSubCgeneral_conv/batch_normalization/batchnorm/ReadVariableOp_2:value:04general_conv/batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes
: ?
0general_conv/batch_normalization/batchnorm/add_1AddV24general_conv/batch_normalization/batchnorm/mul_1:z:02general_conv/batch_normalization/batchnorm/sub:z:0*
T0*'
_output_shapes
:????????? ?
general_conv/dropout_1/IdentityIdentity4general_conv/batch_normalization/batchnorm/add_1:z:0*
T0*'
_output_shapes
:????????? s
general_conv/EluElu(general_conv/dropout_1/Identity:output:0*
T0*'
_output_shapes
:????????? `
general_conv/ShapeShapegeneral_conv/Elu:activations:0*
T0*
_output_shapes
:s
 general_conv/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????u
"general_conv/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?????????l
"general_conv/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
general_conv/strided_sliceStridedSlicegeneral_conv/Shape:output:0)general_conv/strided_slice/stack:output:0+general_conv/strided_slice/stack_1:output:0+general_conv/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_masks
"general_conv/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       u
$general_conv/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       u
$general_conv/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
general_conv/strided_slice_1StridedSliceinputs+general_conv/strided_slice_1/stack:output:0-general_conv/strided_slice_1/stack_1:output:0-general_conv/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_masks
"general_conv/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        u
$general_conv/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       u
$general_conv/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
general_conv/strided_slice_2StridedSliceinputs+general_conv/strided_slice_2/stack:output:0-general_conv/strided_slice_2/stack_1:output:0-general_conv/strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maske
general_conv/GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
general_conv/GatherV2GatherV2general_conv/Elu:activations:0%general_conv/strided_slice_2:output:0#general_conv/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:????????? ?
general_conv/UnsortedSegmentSumUnsortedSegmentSumgeneral_conv/GatherV2:output:0%general_conv/strided_slice_1:output:0#general_conv/strided_slice:output:0*
T0*
Tindices0	*'
_output_shapes
:????????? ]
ShapeShape(general_conv/UnsortedSegmentSum:output:0*
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
shrink_axis_maskK
	truediv/yConst*
_output_shapes
: *
dtype0*
value	B :d\
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
valueB 2      Y@X
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
: S
Reshape/shape_1/1Const*
_output_shapes
: *
dtype0*
value	B :dS
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
ReshapeReshape(general_conv/UnsortedSegmentSum:output:0Reshape/shape_1:output:0*
T0*+
_output_shapes
:?????????d ^
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"?????  w
flatten/ReshapeReshapeReshape:output:0flatten/Const:output:0*
T0*(
_output_shapes
:???????????
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
dense/MatMulMatMulflatten/Reshape:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????]

dense/ReluReludense/BiasAdd:output:0*
T0*(
_output_shapes
:???????????
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
dense_1/MatMulMatMuldense/Relu:activations:0%dense_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????a
dense_1/ReluReludense_1/BiasAdd:output:0*
T0*(
_output_shapes
:??????????k
dropout/IdentityIdentitydense_1/Relu:activations:0*
T0*(
_output_shapes
:???????????
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource*
_output_shapes
:	?*
dtype0?
dense_2/MatMulMatMuldropout/Identity:output:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????f
dense_2/SigmoidSigmoiddense_2/BiasAdd:output:0*
T0*'
_output_shapes
:??????????
9net/general_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOp+general_conv_matmul_readvariableop_resource*
_output_shapes

: *
dtype0?
*net/general_conv/kernel/Regularizer/SquareSquareAnet/general_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: z
)net/general_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
'net/general_conv/kernel/Regularizer/SumSum.net/general_conv/kernel/Regularizer/Square:y:02net/general_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: n
)net/general_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
'net/general_conv/kernel/Regularizer/mulMul2net/general_conv/kernel/Regularizer/mul/x:output:00net/general_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
2net/dense/kernel/Regularizer/Square/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
#net/dense/kernel/Regularizer/SquareSquare:net/dense/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??s
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
??*
dtype0?
%net/dense_1/kernel/Regularizer/SquareSquare<net/dense_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
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
_output_shapes
:	?*
dtype0?
%net/dense_2/kernel/Regularizer/SquareSquare<net/dense_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?u
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
IdentityIdentitydense_2/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp^dense_1/BiasAdd/ReadVariableOp^dense_1/MatMul/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp$^general_conv/BiasAdd/ReadVariableOp#^general_conv/MatMul/ReadVariableOp:^general_conv/batch_normalization/batchnorm/ReadVariableOp<^general_conv/batch_normalization/batchnorm/ReadVariableOp_1<^general_conv/batch_normalization/batchnorm/ReadVariableOp_2>^general_conv/batch_normalization/batchnorm/mul/ReadVariableOp3^net/dense/kernel/Regularizer/Square/ReadVariableOp5^net/dense_1/kernel/Regularizer/Square/ReadVariableOp5^net/dense_2/kernel/Regularizer/Square/ReadVariableOp:^net/general_conv/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*u
_input_shapesd
b:?????????:?????????:?????????::?????????: : : : : : : : : : : : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2J
#general_conv/BiasAdd/ReadVariableOp#general_conv/BiasAdd/ReadVariableOp2H
"general_conv/MatMul/ReadVariableOp"general_conv/MatMul/ReadVariableOp2v
9general_conv/batch_normalization/batchnorm/ReadVariableOp9general_conv/batch_normalization/batchnorm/ReadVariableOp2z
;general_conv/batch_normalization/batchnorm/ReadVariableOp_1;general_conv/batch_normalization/batchnorm/ReadVariableOp_12z
;general_conv/batch_normalization/batchnorm/ReadVariableOp_2;general_conv/batch_normalization/batchnorm/ReadVariableOp_22~
=general_conv/batch_normalization/batchnorm/mul/ReadVariableOp=general_conv/batch_normalization/batchnorm/mul/ReadVariableOp2h
2net/dense/kernel/Regularizer/Square/ReadVariableOp2net/dense/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_1/kernel/Regularizer/Square/ReadVariableOp4net/dense_1/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_2/kernel/Regularizer/Square/ReadVariableOp4net/dense_2/kernel/Regularizer/Square/ReadVariableOp2v
9net/general_conv/kernel/Regularizer/Square/ReadVariableOp9net/general_conv/kernel/Regularizer/Square/ReadVariableOp:Q M
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
?
E
)__inference_flatten_layer_call_fn_6694404

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
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *M
fHRF
D__inference_flatten_layer_call_and_return_conditional_losses_6693194a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????d :S O
+
_output_shapes
:?????????d 
 
_user_specified_nameinputs
?S
?
@__inference_net_layer_call_and_return_conditional_losses_6693297

inputs
inputs_1	
inputs_2
inputs_3	
inputs_4	&
general_conv_6693158: "
general_conv_6693160: "
general_conv_6693162: "
general_conv_6693164: "
general_conv_6693166: "
general_conv_6693168: !
dense_6693214:
??
dense_6693216:	?#
dense_1_6693237:
??
dense_1_6693239:	?"
dense_2_6693267:	?
dense_2_6693269:
identity??dense/StatefulPartitionedCall?dense_1/StatefulPartitionedCall?dense_2/StatefulPartitionedCall?$general_conv/StatefulPartitionedCall?2net/dense/kernel/Regularizer/Square/ReadVariableOp?4net/dense_1/kernel/Regularizer/Square/ReadVariableOp?4net/dense_2/kernel/Regularizer/Square/ReadVariableOp?9net/general_conv/kernel/Regularizer/Square/ReadVariableOpU
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:?????????d
general_conv/CastCastCast:y:0*

DstT0*

SrcT0*'
_output_shapes
:??????????
$general_conv/StatefulPartitionedCallStatefulPartitionedCallgeneral_conv/Cast:y:0inputs_1inputs_2inputs_3general_conv_6693158general_conv_6693160general_conv_6693162general_conv_6693164general_conv_6693166general_conv_6693168*
Tin
2
		*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:????????? *(
_read_only_resource_inputs

	*0
config_proto 

CPU

GPU2*0J 8? *R
fMRK
I__inference_general_conv_layer_call_and_return_conditional_losses_6693157b
ShapeShape-general_conv/StatefulPartitionedCall:output:0*
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
shrink_axis_maskK
	truediv/yConst*
_output_shapes
: *
dtype0*
value	B :d\
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
valueB 2      Y@X
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
: S
Reshape/shape_1/1Const*
_output_shapes
: *
dtype0*
value	B :dS
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
ReshapeReshape-general_conv/StatefulPartitionedCall:output:0Reshape/shape_1:output:0*
T0*+
_output_shapes
:?????????d ?
flatten/PartitionedCallPartitionedCallReshape:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *M
fHRF
D__inference_flatten_layer_call_and_return_conditional_losses_6693194?
dense/StatefulPartitionedCallStatefulPartitionedCall flatten/PartitionedCall:output:0dense_6693214dense_6693216*
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
GPU2*0J 8? *K
fFRD
B__inference_dense_layer_call_and_return_conditional_losses_6693213?
dense_1/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0dense_1_6693237dense_1_6693239*
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
GPU2*0J 8? *M
fHRF
D__inference_dense_1_layer_call_and_return_conditional_losses_6693236?
dropout/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *M
fHRF
D__inference_dropout_layer_call_and_return_conditional_losses_6693247?
dense_2/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0dense_2_6693267dense_2_6693269*
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
GPU2*0J 8? *M
fHRF
D__inference_dense_2_layer_call_and_return_conditional_losses_6693266?
9net/general_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOpgeneral_conv_6693158*
_output_shapes

: *
dtype0?
*net/general_conv/kernel/Regularizer/SquareSquareAnet/general_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: z
)net/general_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
'net/general_conv/kernel/Regularizer/SumSum.net/general_conv/kernel/Regularizer/Square:y:02net/general_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: n
)net/general_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
'net/general_conv/kernel/Regularizer/mulMul2net/general_conv/kernel/Regularizer/mul/x:output:00net/general_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
2net/dense/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdense_6693214* 
_output_shapes
:
??*
dtype0?
#net/dense/kernel/Regularizer/SquareSquare:net/dense/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??s
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
4net/dense_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdense_1_6693237* 
_output_shapes
:
??*
dtype0?
%net/dense_1/kernel/Regularizer/SquareSquare<net/dense_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
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
4net/dense_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdense_2_6693267*
_output_shapes
:	?*
dtype0?
%net/dense_2/kernel/Regularizer/SquareSquare<net/dense_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?u
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
: w
IdentityIdentity(dense_2/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall%^general_conv/StatefulPartitionedCall3^net/dense/kernel/Regularizer/Square/ReadVariableOp5^net/dense_1/kernel/Regularizer/Square/ReadVariableOp5^net/dense_2/kernel/Regularizer/Square/ReadVariableOp:^net/general_conv/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*u
_input_shapesd
b:?????????:?????????:?????????::?????????: : : : : : : : : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2L
$general_conv/StatefulPartitionedCall$general_conv/StatefulPartitionedCall2h
2net/dense/kernel/Regularizer/Square/ReadVariableOp2net/dense/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_1/kernel/Regularizer/Square/ReadVariableOp4net/dense_1/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_2/kernel/Regularizer/Square/ReadVariableOp4net/dense_2/kernel/Regularizer/Square/ReadVariableOp2v
9net/general_conv/kernel/Regularizer/Square/ReadVariableOp9net/general_conv/kernel/Regularizer/Square/ReadVariableOp:O K
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
?
E
)__inference_dropout_layer_call_fn_6694377

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
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *M
fHRF
D__inference_dropout_layer_call_and_return_conditional_losses_6693247a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:??????????:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
__inference_loss_fn_1_6694528O
;net_dense_kernel_regularizer_square_readvariableop_resource:
??
identity??2net/dense/kernel/Regularizer/Square/ReadVariableOp?
2net/dense/kernel/Regularizer/Square/ReadVariableOpReadVariableOp;net_dense_kernel_regularizer_square_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
#net/dense/kernel/Regularizer/SquareSquare:net/dense/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??s
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
`
D__inference_flatten_layer_call_and_return_conditional_losses_6694410

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"?????  ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:??????????Y
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????d :S O
+
_output_shapes
:?????????d 
 
_user_specified_nameinputs
?
?
'__inference_dense_layer_call_fn_6694425

inputs
unknown:
??
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
GPU2*0J 8? *K
fFRD
B__inference_dense_layer_call_and_return_conditional_losses_6693213p
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
:??????????: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
D__inference_dense_2_layer_call_and_return_conditional_losses_6694506

inputs1
matmul_readvariableop_resource:	?-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?4net/dense_2/kernel/Regularizer/Square/ReadVariableOpu
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
4net/dense_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?*
dtype0?
%net/dense_2/kernel/Regularizer/SquareSquare<net/dense_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?u
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
: Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp5^net/dense_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2l
4net/dense_2/kernel/Regularizer/Square/ReadVariableOp4net/dense_2/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?%
?
P__inference_batch_normalization_layer_call_and_return_conditional_losses_6694630

inputs5
'assignmovingavg_readvariableop_resource: 7
)assignmovingavg_1_readvariableop_resource: 3
%batchnorm_mul_readvariableop_resource: /
!batchnorm_readvariableop_resource: 
identity??AssignMovingAvg?AssignMovingAvg/ReadVariableOp?AssignMovingAvg_1? AssignMovingAvg_1/ReadVariableOp?batchnorm/ReadVariableOp?batchnorm/mul/ReadVariableOph
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

: *
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

: ?
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:????????? l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ?
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

: *
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
: *
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
: *
squeeze_dims
 Z
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes
: *
dtype0?
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes
: x
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes
: ?
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0\
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes
: *
dtype0?
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes
: ~
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
: ?
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o?:q
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes
: P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
: ~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
: c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:????????? h
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes
: v
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0p
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
: r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:????????? b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:????????? ?
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:????????? : : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:????????? 
 
_user_specified_nameinputs
?
`
D__inference_flatten_layer_call_and_return_conditional_losses_6693194

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"?????  ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:??????????Y
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:?????????d :S O
+
_output_shapes
:?????????d 
 
_user_specified_nameinputs
?T
?
@__inference_net_layer_call_and_return_conditional_losses_6693610

inputs
inputs_1	
inputs_2
inputs_3	
inputs_4	&
general_conv_6693538: "
general_conv_6693540: "
general_conv_6693542: "
general_conv_6693544: "
general_conv_6693546: "
general_conv_6693548: !
dense_6693569:
??
dense_6693571:	?#
dense_1_6693574:
??
dense_1_6693576:	?"
dense_2_6693580:	?
dense_2_6693582:
identity??dense/StatefulPartitionedCall?dense_1/StatefulPartitionedCall?dense_2/StatefulPartitionedCall?dropout/StatefulPartitionedCall?$general_conv/StatefulPartitionedCall?2net/dense/kernel/Regularizer/Square/ReadVariableOp?4net/dense_1/kernel/Regularizer/Square/ReadVariableOp?4net/dense_2/kernel/Regularizer/Square/ReadVariableOp?9net/general_conv/kernel/Regularizer/Square/ReadVariableOpU
CastCastinputs*

DstT0*

SrcT0*'
_output_shapes
:?????????d
general_conv/CastCastCast:y:0*

DstT0*

SrcT0*'
_output_shapes
:??????????
$general_conv/StatefulPartitionedCallStatefulPartitionedCallgeneral_conv/Cast:y:0inputs_1inputs_2inputs_3general_conv_6693538general_conv_6693540general_conv_6693542general_conv_6693544general_conv_6693546general_conv_6693548*
Tin
2
		*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:????????? *&
_read_only_resource_inputs
	*0
config_proto 

CPU

GPU2*0J 8? *R
fMRK
I__inference_general_conv_layer_call_and_return_conditional_losses_6693475b
ShapeShape-general_conv/StatefulPartitionedCall:output:0*
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
shrink_axis_maskK
	truediv/yConst*
_output_shapes
: *
dtype0*
value	B :d\
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
valueB 2      Y@X
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
: S
Reshape/shape_1/1Const*
_output_shapes
: *
dtype0*
value	B :dS
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
ReshapeReshape-general_conv/StatefulPartitionedCall:output:0Reshape/shape_1:output:0*
T0*+
_output_shapes
:?????????d ?
flatten/PartitionedCallPartitionedCallReshape:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *M
fHRF
D__inference_flatten_layer_call_and_return_conditional_losses_6693194?
dense/StatefulPartitionedCallStatefulPartitionedCall flatten/PartitionedCall:output:0dense_6693569dense_6693571*
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
GPU2*0J 8? *K
fFRD
B__inference_dense_layer_call_and_return_conditional_losses_6693213?
dense_1/StatefulPartitionedCallStatefulPartitionedCall&dense/StatefulPartitionedCall:output:0dense_1_6693574dense_1_6693576*
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
GPU2*0J 8? *M
fHRF
D__inference_dense_1_layer_call_and_return_conditional_losses_6693236?
dropout/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *M
fHRF
D__inference_dropout_layer_call_and_return_conditional_losses_6693354?
dense_2/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0dense_2_6693580dense_2_6693582*
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
GPU2*0J 8? *M
fHRF
D__inference_dense_2_layer_call_and_return_conditional_losses_6693266?
9net/general_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOpgeneral_conv_6693538*
_output_shapes

: *
dtype0?
*net/general_conv/kernel/Regularizer/SquareSquareAnet/general_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: z
)net/general_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
'net/general_conv/kernel/Regularizer/SumSum.net/general_conv/kernel/Regularizer/Square:y:02net/general_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: n
)net/general_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
'net/general_conv/kernel/Regularizer/mulMul2net/general_conv/kernel/Regularizer/mul/x:output:00net/general_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
2net/dense/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdense_6693569* 
_output_shapes
:
??*
dtype0?
#net/dense/kernel/Regularizer/SquareSquare:net/dense/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??s
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
4net/dense_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdense_1_6693574* 
_output_shapes
:
??*
dtype0?
%net/dense_1/kernel/Regularizer/SquareSquare<net/dense_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
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
4net/dense_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpdense_2_6693580*
_output_shapes
:	?*
dtype0?
%net/dense_2/kernel/Regularizer/SquareSquare<net/dense_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?u
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
: w
IdentityIdentity(dense_2/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp^dense/StatefulPartitionedCall ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dropout/StatefulPartitionedCall%^general_conv/StatefulPartitionedCall3^net/dense/kernel/Regularizer/Square/ReadVariableOp5^net/dense_1/kernel/Regularizer/Square/ReadVariableOp5^net/dense_2/kernel/Regularizer/Square/ReadVariableOp:^net/general_conv/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*u
_input_shapesd
b:?????????:?????????:?????????::?????????: : : : : : : : : : : : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2L
$general_conv/StatefulPartitionedCall$general_conv/StatefulPartitionedCall2h
2net/dense/kernel/Regularizer/Square/ReadVariableOp2net/dense/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_1/kernel/Regularizer/Square/ReadVariableOp4net/dense_1/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_2/kernel/Regularizer/Square/ReadVariableOp4net/dense_2/kernel/Regularizer/Square/ReadVariableOp2v
9net/general_conv/kernel/Regularizer/Square/ReadVariableOp9net/general_conv/kernel/Regularizer/Square/ReadVariableOp:O K
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
?W
?
I__inference_general_conv_layer_call_and_return_conditional_losses_6694372
inputs_0

inputs	
inputs_1
inputs_2	0
matmul_readvariableop_resource: -
biasadd_readvariableop_resource: I
;batch_normalization_assignmovingavg_readvariableop_resource: K
=batch_normalization_assignmovingavg_1_readvariableop_resource: G
9batch_normalization_batchnorm_mul_readvariableop_resource: C
5batch_normalization_batchnorm_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?#batch_normalization/AssignMovingAvg?2batch_normalization/AssignMovingAvg/ReadVariableOp?%batch_normalization/AssignMovingAvg_1?4batch_normalization/AssignMovingAvg_1/ReadVariableOp?,batch_normalization/batchnorm/ReadVariableOp?0batch_normalization/batchnorm/mul/ReadVariableOp?9net/general_conv/kernel/Regularizer/Square/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype0k
MatMulMatMulinputs_0MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? |
2batch_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ?
 batch_normalization/moments/meanMeanBiasAdd:output:0;batch_normalization/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

: *
	keep_dims(?
(batch_normalization/moments/StopGradientStopGradient)batch_normalization/moments/mean:output:0*
T0*
_output_shapes

: ?
-batch_normalization/moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:01batch_normalization/moments/StopGradient:output:0*
T0*'
_output_shapes
:????????? ?
6batch_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ?
$batch_normalization/moments/varianceMean1batch_normalization/moments/SquaredDifference:z:0?batch_normalization/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

: *
	keep_dims(?
#batch_normalization/moments/SqueezeSqueeze)batch_normalization/moments/mean:output:0*
T0*
_output_shapes
: *
squeeze_dims
 ?
%batch_normalization/moments/Squeeze_1Squeeze-batch_normalization/moments/variance:output:0*
T0*
_output_shapes
: *
squeeze_dims
 n
)batch_normalization/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
2batch_normalization/AssignMovingAvg/ReadVariableOpReadVariableOp;batch_normalization_assignmovingavg_readvariableop_resource*
_output_shapes
: *
dtype0?
'batch_normalization/AssignMovingAvg/subSub:batch_normalization/AssignMovingAvg/ReadVariableOp:value:0,batch_normalization/moments/Squeeze:output:0*
T0*
_output_shapes
: ?
'batch_normalization/AssignMovingAvg/mulMul+batch_normalization/AssignMovingAvg/sub:z:02batch_normalization/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
: ?
#batch_normalization/AssignMovingAvgAssignSubVariableOp;batch_normalization_assignmovingavg_readvariableop_resource+batch_normalization/AssignMovingAvg/mul:z:03^batch_normalization/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0p
+batch_normalization/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
4batch_normalization/AssignMovingAvg_1/ReadVariableOpReadVariableOp=batch_normalization_assignmovingavg_1_readvariableop_resource*
_output_shapes
: *
dtype0?
)batch_normalization/AssignMovingAvg_1/subSub<batch_normalization/AssignMovingAvg_1/ReadVariableOp:value:0.batch_normalization/moments/Squeeze_1:output:0*
T0*
_output_shapes
: ?
)batch_normalization/AssignMovingAvg_1/mulMul-batch_normalization/AssignMovingAvg_1/sub:z:04batch_normalization/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
: ?
%batch_normalization/AssignMovingAvg_1AssignSubVariableOp=batch_normalization_assignmovingavg_1_readvariableop_resource-batch_normalization/AssignMovingAvg_1/mul:z:05^batch_normalization/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0h
#batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o?:?
!batch_normalization/batchnorm/addAddV2.batch_normalization/moments/Squeeze_1:output:0,batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes
: x
#batch_normalization/batchnorm/RsqrtRsqrt%batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes
: ?
0batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0?
!batch_normalization/batchnorm/mulMul'batch_normalization/batchnorm/Rsqrt:y:08batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
: ?
#batch_normalization/batchnorm/mul_1MulBiasAdd:output:0%batch_normalization/batchnorm/mul:z:0*
T0*'
_output_shapes
:????????? ?
#batch_normalization/batchnorm/mul_2Mul,batch_normalization/moments/Squeeze:output:0%batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes
: ?
,batch_normalization/batchnorm/ReadVariableOpReadVariableOp5batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0?
!batch_normalization/batchnorm/subSub4batch_normalization/batchnorm/ReadVariableOp:value:0'batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes
: ?
#batch_normalization/batchnorm/add_1AddV2'batch_normalization/batchnorm/mul_1:z:0%batch_normalization/batchnorm/sub:z:0*
T0*'
_output_shapes
:????????? e
EluElu'batch_normalization/batchnorm/add_1:z:0*
T0*'
_output_shapes
:????????? F
ShapeShapeElu:activations:0*
T0*
_output_shapes
:f
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????h
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?????????_
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
shrink_axis_maskf
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_1StridedSliceinputsstrided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskf
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        h
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_2StridedSliceinputsstrided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskX
GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
GatherV2GatherV2Elu:activations:0strided_slice_2:output:0GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:????????? ?
UnsortedSegmentSumUnsortedSegmentSumGatherV2:output:0strided_slice_1:output:0strided_slice:output:0*
T0*
Tindices0	*'
_output_shapes
:????????? ?
9net/general_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype0?
*net/general_conv/kernel/Regularizer/SquareSquareAnet/general_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: z
)net/general_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
'net/general_conv/kernel/Regularizer/SumSum.net/general_conv/kernel/Regularizer/Square:y:02net/general_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: n
)net/general_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
'net/general_conv/kernel/Regularizer/mulMul2net/general_conv/kernel/Regularizer/mul/x:output:00net/general_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: j
IdentityIdentityUnsortedSegmentSum:output:0^NoOp*
T0*'
_output_shapes
:????????? ?
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp$^batch_normalization/AssignMovingAvg3^batch_normalization/AssignMovingAvg/ReadVariableOp&^batch_normalization/AssignMovingAvg_15^batch_normalization/AssignMovingAvg_1/ReadVariableOp-^batch_normalization/batchnorm/ReadVariableOp1^batch_normalization/batchnorm/mul/ReadVariableOp:^net/general_conv/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:?????????:?????????:?????????:: : : : : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2J
#batch_normalization/AssignMovingAvg#batch_normalization/AssignMovingAvg2h
2batch_normalization/AssignMovingAvg/ReadVariableOp2batch_normalization/AssignMovingAvg/ReadVariableOp2N
%batch_normalization/AssignMovingAvg_1%batch_normalization/AssignMovingAvg_12l
4batch_normalization/AssignMovingAvg_1/ReadVariableOp4batch_normalization/AssignMovingAvg_1/ReadVariableOp2\
,batch_normalization/batchnorm/ReadVariableOp,batch_normalization/batchnorm/ReadVariableOp2d
0batch_normalization/batchnorm/mul/ReadVariableOp0batch_normalization/batchnorm/mul/ReadVariableOp2v
9net/general_conv/kernel/Regularizer/Square/ReadVariableOp9net/general_conv/kernel/Regularizer/Square/ReadVariableOp:Q M
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
?
__inference_loss_fn_3_6694550P
=net_dense_2_kernel_regularizer_square_readvariableop_resource:	?
identity??4net/dense_2/kernel/Regularizer/Square/ReadVariableOp?
4net/dense_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp=net_dense_2_kernel_regularizer_square_readvariableop_resource*
_output_shapes
:	?*
dtype0?
%net/dense_2/kernel/Regularizer/SquareSquare<net/dense_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?u
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
D__inference_dense_1_layer_call_and_return_conditional_losses_6693236

inputs2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?4net/dense_1/kernel/Regularizer/Square/ReadVariableOpv
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
4net/dense_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
%net/dense_1/kernel/Regularizer/SquareSquare<net/dense_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
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
:???????????
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp5^net/dense_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2l
4net/dense_1/kernel/Regularizer/Square/ReadVariableOp4net/dense_1/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
5__inference_batch_normalization_layer_call_fn_6694563

inputs
unknown: 
	unknown_0: 
	unknown_1: 
	unknown_2: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:????????? *&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *Y
fTRR
P__inference_batch_normalization_layer_call_and_return_conditional_losses_6693029o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:????????? `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:????????? : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:????????? 
 
_user_specified_nameinputs
?
?
.__inference_general_conv_layer_call_fn_6694253
inputs_0

inputs	
inputs_1
inputs_2	
unknown: 
	unknown_0: 
	unknown_1: 
	unknown_2: 
	unknown_3: 
	unknown_4: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputsinputs_1inputs_2unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
2
		*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:????????? *&
_read_only_resource_inputs
	*0
config_proto 

CPU

GPU2*0J 8? *R
fMRK
I__inference_general_conv_layer_call_and_return_conditional_losses_6693475o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:????????? `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:?????????:?????????:?????????:: : : : : : 22
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
?
?
P__inference_batch_normalization_layer_call_and_return_conditional_losses_6694596

inputs/
!batchnorm_readvariableop_resource: 3
%batchnorm_mul_readvariableop_resource: 1
#batchnorm_readvariableop_1_resource: 1
#batchnorm_readvariableop_2_resource: 
identity??batchnorm/ReadVariableOp?batchnorm/ReadVariableOp_1?batchnorm/ReadVariableOp_2?batchnorm/mul/ReadVariableOpv
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o?:w
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes
: P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
: ~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
: c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:????????? z
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes
: *
dtype0r
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes
: z
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes
: *
dtype0r
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
: r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:????????? b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:????????? ?
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:????????? : : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:????????? 
 
_user_specified_nameinputs
?
?
%__inference_net_layer_call_fn_6693924
inputs_0

inputs	
inputs_1
inputs_2	

inputs_2_0	
unknown: 
	unknown_0: 
	unknown_1: 
	unknown_2: 
	unknown_3: 
	unknown_4: 
	unknown_5:
??
	unknown_6:	?
	unknown_7:
??
	unknown_8:	?
	unknown_9:	?

unknown_10:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputsinputs_1inputs_2
inputs_2_0unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2			*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_net_layer_call_and_return_conditional_losses_6693297o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*u
_input_shapesd
b:?????????:?????????:?????????::?????????: : : : : : : : : : : : 22
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
?
?
D__inference_dense_2_layer_call_and_return_conditional_losses_6693266

inputs1
matmul_readvariableop_resource:	?-
biasadd_readvariableop_resource:
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?4net/dense_2/kernel/Regularizer/Square/ReadVariableOpu
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
4net/dense_2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	?*
dtype0?
%net/dense_2/kernel/Regularizer/SquareSquare<net/dense_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?u
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
: Z
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp5^net/dense_2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2l
4net/dense_2/kernel/Regularizer/Square/ReadVariableOp4net/dense_2/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
%__inference_net_layer_call_fn_6693957
inputs_0

inputs	
inputs_1
inputs_2	

inputs_2_0	
unknown: 
	unknown_0: 
	unknown_1: 
	unknown_2: 
	unknown_3: 
	unknown_4: 
	unknown_5:
??
	unknown_6:	?
	unknown_7:
??
	unknown_8:	?
	unknown_9:	?

unknown_10:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputsinputs_1inputs_2
inputs_2_0unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2			*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*,
_read_only_resource_inputs

	
*0
config_proto 

CPU

GPU2*0J 8? *I
fDRB
@__inference_net_layer_call_and_return_conditional_losses_6693610o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*u
_input_shapesd
b:?????????:?????????:?????????::?????????: : : : : : : : : : : : 22
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
?
?
B__inference_dense_layer_call_and_return_conditional_losses_6694442

inputs2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?2net/dense/kernel/Regularizer/Square/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
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
2net/dense/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
#net/dense/kernel/Regularizer/SquareSquare:net/dense/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??s
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
:???????????
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp3^net/dense/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2h
2net/dense/kernel/Regularizer/Square/ReadVariableOp2net/dense/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
??
?
@__inference_net_layer_call_and_return_conditional_losses_6694207
inputs_0

inputs	
inputs_1
inputs_2	

inputs_2_0	=
+general_conv_matmul_readvariableop_resource: :
,general_conv_biasadd_readvariableop_resource: V
Hgeneral_conv_batch_normalization_assignmovingavg_readvariableop_resource: X
Jgeneral_conv_batch_normalization_assignmovingavg_1_readvariableop_resource: T
Fgeneral_conv_batch_normalization_batchnorm_mul_readvariableop_resource: P
Bgeneral_conv_batch_normalization_batchnorm_readvariableop_resource: 8
$dense_matmul_readvariableop_resource:
??4
%dense_biasadd_readvariableop_resource:	?:
&dense_1_matmul_readvariableop_resource:
??6
'dense_1_biasadd_readvariableop_resource:	?9
&dense_2_matmul_readvariableop_resource:	?5
'dense_2_biasadd_readvariableop_resource:
identity??dense/BiasAdd/ReadVariableOp?dense/MatMul/ReadVariableOp?dense_1/BiasAdd/ReadVariableOp?dense_1/MatMul/ReadVariableOp?dense_2/BiasAdd/ReadVariableOp?dense_2/MatMul/ReadVariableOp?#general_conv/BiasAdd/ReadVariableOp?"general_conv/MatMul/ReadVariableOp?0general_conv/batch_normalization/AssignMovingAvg??general_conv/batch_normalization/AssignMovingAvg/ReadVariableOp?2general_conv/batch_normalization/AssignMovingAvg_1?Ageneral_conv/batch_normalization/AssignMovingAvg_1/ReadVariableOp?9general_conv/batch_normalization/batchnorm/ReadVariableOp?=general_conv/batch_normalization/batchnorm/mul/ReadVariableOp?2net/dense/kernel/Regularizer/Square/ReadVariableOp?4net/dense_1/kernel/Regularizer/Square/ReadVariableOp?4net/dense_2/kernel/Regularizer/Square/ReadVariableOp?9net/general_conv/kernel/Regularizer/Square/ReadVariableOpW
CastCastinputs_0*

DstT0*

SrcT0*'
_output_shapes
:?????????d
general_conv/CastCastCast:y:0*

DstT0*

SrcT0*'
_output_shapes
:??????????
"general_conv/MatMul/ReadVariableOpReadVariableOp+general_conv_matmul_readvariableop_resource*
_output_shapes

: *
dtype0?
general_conv/MatMulMatMulgeneral_conv/Cast:y:0*general_conv/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? ?
#general_conv/BiasAdd/ReadVariableOpReadVariableOp,general_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0?
general_conv/BiasAddBiasAddgeneral_conv/MatMul:product:0+general_conv/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? ?
?general_conv/batch_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ?
-general_conv/batch_normalization/moments/meanMeangeneral_conv/BiasAdd:output:0Hgeneral_conv/batch_normalization/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

: *
	keep_dims(?
5general_conv/batch_normalization/moments/StopGradientStopGradient6general_conv/batch_normalization/moments/mean:output:0*
T0*
_output_shapes

: ?
:general_conv/batch_normalization/moments/SquaredDifferenceSquaredDifferencegeneral_conv/BiasAdd:output:0>general_conv/batch_normalization/moments/StopGradient:output:0*
T0*'
_output_shapes
:????????? ?
Cgeneral_conv/batch_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ?
1general_conv/batch_normalization/moments/varianceMean>general_conv/batch_normalization/moments/SquaredDifference:z:0Lgeneral_conv/batch_normalization/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

: *
	keep_dims(?
0general_conv/batch_normalization/moments/SqueezeSqueeze6general_conv/batch_normalization/moments/mean:output:0*
T0*
_output_shapes
: *
squeeze_dims
 ?
2general_conv/batch_normalization/moments/Squeeze_1Squeeze:general_conv/batch_normalization/moments/variance:output:0*
T0*
_output_shapes
: *
squeeze_dims
 {
6general_conv/batch_normalization/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
?general_conv/batch_normalization/AssignMovingAvg/ReadVariableOpReadVariableOpHgeneral_conv_batch_normalization_assignmovingavg_readvariableop_resource*
_output_shapes
: *
dtype0?
4general_conv/batch_normalization/AssignMovingAvg/subSubGgeneral_conv/batch_normalization/AssignMovingAvg/ReadVariableOp:value:09general_conv/batch_normalization/moments/Squeeze:output:0*
T0*
_output_shapes
: ?
4general_conv/batch_normalization/AssignMovingAvg/mulMul8general_conv/batch_normalization/AssignMovingAvg/sub:z:0?general_conv/batch_normalization/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
: ?
0general_conv/batch_normalization/AssignMovingAvgAssignSubVariableOpHgeneral_conv_batch_normalization_assignmovingavg_readvariableop_resource8general_conv/batch_normalization/AssignMovingAvg/mul:z:0@^general_conv/batch_normalization/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0}
8general_conv/batch_normalization/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
Ageneral_conv/batch_normalization/AssignMovingAvg_1/ReadVariableOpReadVariableOpJgeneral_conv_batch_normalization_assignmovingavg_1_readvariableop_resource*
_output_shapes
: *
dtype0?
6general_conv/batch_normalization/AssignMovingAvg_1/subSubIgeneral_conv/batch_normalization/AssignMovingAvg_1/ReadVariableOp:value:0;general_conv/batch_normalization/moments/Squeeze_1:output:0*
T0*
_output_shapes
: ?
6general_conv/batch_normalization/AssignMovingAvg_1/mulMul:general_conv/batch_normalization/AssignMovingAvg_1/sub:z:0Ageneral_conv/batch_normalization/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
: ?
2general_conv/batch_normalization/AssignMovingAvg_1AssignSubVariableOpJgeneral_conv_batch_normalization_assignmovingavg_1_readvariableop_resource:general_conv/batch_normalization/AssignMovingAvg_1/mul:z:0B^general_conv/batch_normalization/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0u
0general_conv/batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o?:?
.general_conv/batch_normalization/batchnorm/addAddV2;general_conv/batch_normalization/moments/Squeeze_1:output:09general_conv/batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes
: ?
0general_conv/batch_normalization/batchnorm/RsqrtRsqrt2general_conv/batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes
: ?
=general_conv/batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOpFgeneral_conv_batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0?
.general_conv/batch_normalization/batchnorm/mulMul4general_conv/batch_normalization/batchnorm/Rsqrt:y:0Egeneral_conv/batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
: ?
0general_conv/batch_normalization/batchnorm/mul_1Mulgeneral_conv/BiasAdd:output:02general_conv/batch_normalization/batchnorm/mul:z:0*
T0*'
_output_shapes
:????????? ?
0general_conv/batch_normalization/batchnorm/mul_2Mul9general_conv/batch_normalization/moments/Squeeze:output:02general_conv/batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes
: ?
9general_conv/batch_normalization/batchnorm/ReadVariableOpReadVariableOpBgeneral_conv_batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0?
.general_conv/batch_normalization/batchnorm/subSubAgeneral_conv/batch_normalization/batchnorm/ReadVariableOp:value:04general_conv/batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes
: ?
0general_conv/batch_normalization/batchnorm/add_1AddV24general_conv/batch_normalization/batchnorm/mul_1:z:02general_conv/batch_normalization/batchnorm/sub:z:0*
T0*'
_output_shapes
:????????? 
general_conv/EluElu4general_conv/batch_normalization/batchnorm/add_1:z:0*
T0*'
_output_shapes
:????????? `
general_conv/ShapeShapegeneral_conv/Elu:activations:0*
T0*
_output_shapes
:s
 general_conv/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????u
"general_conv/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?????????l
"general_conv/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
general_conv/strided_sliceStridedSlicegeneral_conv/Shape:output:0)general_conv/strided_slice/stack:output:0+general_conv/strided_slice/stack_1:output:0+general_conv/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_masks
"general_conv/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       u
$general_conv/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       u
$general_conv/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
general_conv/strided_slice_1StridedSliceinputs+general_conv/strided_slice_1/stack:output:0-general_conv/strided_slice_1/stack_1:output:0-general_conv/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_masks
"general_conv/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        u
$general_conv/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       u
$general_conv/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
general_conv/strided_slice_2StridedSliceinputs+general_conv/strided_slice_2/stack:output:0-general_conv/strided_slice_2/stack_1:output:0-general_conv/strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maske
general_conv/GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
general_conv/GatherV2GatherV2general_conv/Elu:activations:0%general_conv/strided_slice_2:output:0#general_conv/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:????????? ?
general_conv/UnsortedSegmentSumUnsortedSegmentSumgeneral_conv/GatherV2:output:0%general_conv/strided_slice_1:output:0#general_conv/strided_slice:output:0*
T0*
Tindices0	*'
_output_shapes
:????????? ]
ShapeShape(general_conv/UnsortedSegmentSum:output:0*
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
shrink_axis_maskK
	truediv/yConst*
_output_shapes
: *
dtype0*
value	B :d\
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
valueB 2      Y@X
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
: S
Reshape/shape_1/1Const*
_output_shapes
: *
dtype0*
value	B :dS
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
ReshapeReshape(general_conv/UnsortedSegmentSum:output:0Reshape/shape_1:output:0*
T0*+
_output_shapes
:?????????d ^
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"?????  w
flatten/ReshapeReshapeReshape:output:0flatten/Const:output:0*
T0*(
_output_shapes
:???????????
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
dense/MatMulMatMulflatten/Reshape:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????]

dense/ReluReludense/BiasAdd:output:0*
T0*(
_output_shapes
:???????????
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
dense_1/MatMulMatMuldense/Relu:activations:0%dense_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????a
dense_1/ReluReludense_1/BiasAdd:output:0*
T0*(
_output_shapes
:??????????Z
dropout/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @?
dropout/dropout/MulMuldense_1/Relu:activations:0dropout/dropout/Const:output:0*
T0*(
_output_shapes
:??????????_
dropout/dropout/ShapeShapedense_1/Relu:activations:0*
T0*
_output_shapes
:?
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape:output:0*
T0*(
_output_shapes
:??????????*
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
:???????????
dropout/dropout/CastCast dropout/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:???????????
dropout/dropout/Mul_1Muldropout/dropout/Mul:z:0dropout/dropout/Cast:y:0*
T0*(
_output_shapes
:???????????
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource*
_output_shapes
:	?*
dtype0?
dense_2/MatMulMatMuldropout/dropout/Mul_1:z:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????f
dense_2/SigmoidSigmoiddense_2/BiasAdd:output:0*
T0*'
_output_shapes
:??????????
9net/general_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOp+general_conv_matmul_readvariableop_resource*
_output_shapes

: *
dtype0?
*net/general_conv/kernel/Regularizer/SquareSquareAnet/general_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: z
)net/general_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
'net/general_conv/kernel/Regularizer/SumSum.net/general_conv/kernel/Regularizer/Square:y:02net/general_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: n
)net/general_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
'net/general_conv/kernel/Regularizer/mulMul2net/general_conv/kernel/Regularizer/mul/x:output:00net/general_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: ?
2net/dense/kernel/Regularizer/Square/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
#net/dense/kernel/Regularizer/SquareSquare:net/dense/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??s
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
??*
dtype0?
%net/dense_1/kernel/Regularizer/SquareSquare<net/dense_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
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
_output_shapes
:	?*
dtype0?
%net/dense_2/kernel/Regularizer/SquareSquare<net/dense_2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:	?u
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
IdentityIdentitydense_2/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp^dense_1/BiasAdd/ReadVariableOp^dense_1/MatMul/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp$^general_conv/BiasAdd/ReadVariableOp#^general_conv/MatMul/ReadVariableOp1^general_conv/batch_normalization/AssignMovingAvg@^general_conv/batch_normalization/AssignMovingAvg/ReadVariableOp3^general_conv/batch_normalization/AssignMovingAvg_1B^general_conv/batch_normalization/AssignMovingAvg_1/ReadVariableOp:^general_conv/batch_normalization/batchnorm/ReadVariableOp>^general_conv/batch_normalization/batchnorm/mul/ReadVariableOp3^net/dense/kernel/Regularizer/Square/ReadVariableOp5^net/dense_1/kernel/Regularizer/Square/ReadVariableOp5^net/dense_2/kernel/Regularizer/Square/ReadVariableOp:^net/general_conv/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*u
_input_shapesd
b:?????????:?????????:?????????::?????????: : : : : : : : : : : : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2J
#general_conv/BiasAdd/ReadVariableOp#general_conv/BiasAdd/ReadVariableOp2H
"general_conv/MatMul/ReadVariableOp"general_conv/MatMul/ReadVariableOp2d
0general_conv/batch_normalization/AssignMovingAvg0general_conv/batch_normalization/AssignMovingAvg2?
?general_conv/batch_normalization/AssignMovingAvg/ReadVariableOp?general_conv/batch_normalization/AssignMovingAvg/ReadVariableOp2h
2general_conv/batch_normalization/AssignMovingAvg_12general_conv/batch_normalization/AssignMovingAvg_12?
Ageneral_conv/batch_normalization/AssignMovingAvg_1/ReadVariableOpAgeneral_conv/batch_normalization/AssignMovingAvg_1/ReadVariableOp2v
9general_conv/batch_normalization/batchnorm/ReadVariableOp9general_conv/batch_normalization/batchnorm/ReadVariableOp2~
=general_conv/batch_normalization/batchnorm/mul/ReadVariableOp=general_conv/batch_normalization/batchnorm/mul/ReadVariableOp2h
2net/dense/kernel/Regularizer/Square/ReadVariableOp2net/dense/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_1/kernel/Regularizer/Square/ReadVariableOp4net/dense_1/kernel/Regularizer/Square/ReadVariableOp2l
4net/dense_2/kernel/Regularizer/Square/ReadVariableOp4net/dense_2/kernel/Regularizer/Square/ReadVariableOp2v
9net/general_conv/kernel/Regularizer/Square/ReadVariableOp9net/general_conv/kernel/Regularizer/Square/ReadVariableOp:Q M
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
B__inference_dense_layer_call_and_return_conditional_losses_6693213

inputs2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?2net/dense/kernel/Regularizer/Square/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
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
2net/dense/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
#net/dense/kernel/Regularizer/SquareSquare:net/dense/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??s
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
:???????????
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp3^net/dense/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2h
2net/dense/kernel/Regularizer/Square/ReadVariableOp2net/dense/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?W
?
I__inference_general_conv_layer_call_and_return_conditional_losses_6693475

inputs
inputs_1	
inputs_2
inputs_3	0
matmul_readvariableop_resource: -
biasadd_readvariableop_resource: I
;batch_normalization_assignmovingavg_readvariableop_resource: K
=batch_normalization_assignmovingavg_1_readvariableop_resource: G
9batch_normalization_batchnorm_mul_readvariableop_resource: C
5batch_normalization_batchnorm_readvariableop_resource: 
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?#batch_normalization/AssignMovingAvg?2batch_normalization/AssignMovingAvg/ReadVariableOp?%batch_normalization/AssignMovingAvg_1?4batch_normalization/AssignMovingAvg_1/ReadVariableOp?,batch_normalization/batchnorm/ReadVariableOp?0batch_normalization/batchnorm/mul/ReadVariableOp?9net/general_conv/kernel/Regularizer/Square/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? |
2batch_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ?
 batch_normalization/moments/meanMeanBiasAdd:output:0;batch_normalization/moments/mean/reduction_indices:output:0*
T0*
_output_shapes

: *
	keep_dims(?
(batch_normalization/moments/StopGradientStopGradient)batch_normalization/moments/mean:output:0*
T0*
_output_shapes

: ?
-batch_normalization/moments/SquaredDifferenceSquaredDifferenceBiasAdd:output:01batch_normalization/moments/StopGradient:output:0*
T0*'
_output_shapes
:????????? ?
6batch_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ?
$batch_normalization/moments/varianceMean1batch_normalization/moments/SquaredDifference:z:0?batch_normalization/moments/variance/reduction_indices:output:0*
T0*
_output_shapes

: *
	keep_dims(?
#batch_normalization/moments/SqueezeSqueeze)batch_normalization/moments/mean:output:0*
T0*
_output_shapes
: *
squeeze_dims
 ?
%batch_normalization/moments/Squeeze_1Squeeze-batch_normalization/moments/variance:output:0*
T0*
_output_shapes
: *
squeeze_dims
 n
)batch_normalization/AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
2batch_normalization/AssignMovingAvg/ReadVariableOpReadVariableOp;batch_normalization_assignmovingavg_readvariableop_resource*
_output_shapes
: *
dtype0?
'batch_normalization/AssignMovingAvg/subSub:batch_normalization/AssignMovingAvg/ReadVariableOp:value:0,batch_normalization/moments/Squeeze:output:0*
T0*
_output_shapes
: ?
'batch_normalization/AssignMovingAvg/mulMul+batch_normalization/AssignMovingAvg/sub:z:02batch_normalization/AssignMovingAvg/decay:output:0*
T0*
_output_shapes
: ?
#batch_normalization/AssignMovingAvgAssignSubVariableOp;batch_normalization_assignmovingavg_readvariableop_resource+batch_normalization/AssignMovingAvg/mul:z:03^batch_normalization/AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0p
+batch_normalization/AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
4batch_normalization/AssignMovingAvg_1/ReadVariableOpReadVariableOp=batch_normalization_assignmovingavg_1_readvariableop_resource*
_output_shapes
: *
dtype0?
)batch_normalization/AssignMovingAvg_1/subSub<batch_normalization/AssignMovingAvg_1/ReadVariableOp:value:0.batch_normalization/moments/Squeeze_1:output:0*
T0*
_output_shapes
: ?
)batch_normalization/AssignMovingAvg_1/mulMul-batch_normalization/AssignMovingAvg_1/sub:z:04batch_normalization/AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
: ?
%batch_normalization/AssignMovingAvg_1AssignSubVariableOp=batch_normalization_assignmovingavg_1_readvariableop_resource-batch_normalization/AssignMovingAvg_1/mul:z:05^batch_normalization/AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0h
#batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o?:?
!batch_normalization/batchnorm/addAddV2.batch_normalization/moments/Squeeze_1:output:0,batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes
: x
#batch_normalization/batchnorm/RsqrtRsqrt%batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes
: ?
0batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0?
!batch_normalization/batchnorm/mulMul'batch_normalization/batchnorm/Rsqrt:y:08batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
: ?
#batch_normalization/batchnorm/mul_1MulBiasAdd:output:0%batch_normalization/batchnorm/mul:z:0*
T0*'
_output_shapes
:????????? ?
#batch_normalization/batchnorm/mul_2Mul,batch_normalization/moments/Squeeze:output:0%batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes
: ?
,batch_normalization/batchnorm/ReadVariableOpReadVariableOp5batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0?
!batch_normalization/batchnorm/subSub4batch_normalization/batchnorm/ReadVariableOp:value:0'batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes
: ?
#batch_normalization/batchnorm/add_1AddV2'batch_normalization/batchnorm/mul_1:z:0%batch_normalization/batchnorm/sub:z:0*
T0*'
_output_shapes
:????????? e
EluElu'batch_normalization/batchnorm/add_1:z:0*
T0*'
_output_shapes
:????????? F
ShapeShapeElu:activations:0*
T0*
_output_shapes
:f
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????h
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?????????_
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
shrink_axis_maskf
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_1StridedSliceinputs_1strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskf
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        h
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_2StridedSliceinputs_1strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskX
GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
GatherV2GatherV2Elu:activations:0strided_slice_2:output:0GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:????????? ?
UnsortedSegmentSumUnsortedSegmentSumGatherV2:output:0strided_slice_1:output:0strided_slice:output:0*
T0*
Tindices0	*'
_output_shapes
:????????? ?
9net/general_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype0?
*net/general_conv/kernel/Regularizer/SquareSquareAnet/general_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: z
)net/general_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
'net/general_conv/kernel/Regularizer/SumSum.net/general_conv/kernel/Regularizer/Square:y:02net/general_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: n
)net/general_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
'net/general_conv/kernel/Regularizer/mulMul2net/general_conv/kernel/Regularizer/mul/x:output:00net/general_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: j
IdentityIdentityUnsortedSegmentSum:output:0^NoOp*
T0*'
_output_shapes
:????????? ?
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp$^batch_normalization/AssignMovingAvg3^batch_normalization/AssignMovingAvg/ReadVariableOp&^batch_normalization/AssignMovingAvg_15^batch_normalization/AssignMovingAvg_1/ReadVariableOp-^batch_normalization/batchnorm/ReadVariableOp1^batch_normalization/batchnorm/mul/ReadVariableOp:^net/general_conv/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:?????????:?????????:?????????:: : : : : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2J
#batch_normalization/AssignMovingAvg#batch_normalization/AssignMovingAvg2h
2batch_normalization/AssignMovingAvg/ReadVariableOp2batch_normalization/AssignMovingAvg/ReadVariableOp2N
%batch_normalization/AssignMovingAvg_1%batch_normalization/AssignMovingAvg_12l
4batch_normalization/AssignMovingAvg_1/ReadVariableOp4batch_normalization/AssignMovingAvg_1/ReadVariableOp2\
,batch_normalization/batchnorm/ReadVariableOp,batch_normalization/batchnorm/ReadVariableOp2d
0batch_normalization/batchnorm/mul/ReadVariableOp0batch_normalization/batchnorm/mul/ReadVariableOp2v
9net/general_conv/kernel/Regularizer/Square/ReadVariableOp9net/general_conv/kernel/Regularizer/Square/ReadVariableOp:O K
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
?
?
)__inference_dense_2_layer_call_fn_6694489

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
GPU2*0J 8? *M
fHRF
D__inference_dense_2_layer_call_and_return_conditional_losses_6693266o
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
?
?
)__inference_dense_1_layer_call_fn_6694457

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
GPU2*0J 8? *M
fHRF
D__inference_dense_1_layer_call_and_return_conditional_losses_6693236p
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
__inference_loss_fn_0_6694517T
Bnet_general_conv_kernel_regularizer_square_readvariableop_resource: 
identity??9net/general_conv/kernel/Regularizer/Square/ReadVariableOp?
9net/general_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOpBnet_general_conv_kernel_regularizer_square_readvariableop_resource*
_output_shapes

: *
dtype0?
*net/general_conv/kernel/Regularizer/SquareSquareAnet/general_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: z
)net/general_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
'net/general_conv/kernel/Regularizer/SumSum.net/general_conv/kernel/Regularizer/Square:y:02net/general_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: n
)net/general_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
'net/general_conv/kernel/Regularizer/mulMul2net/general_conv/kernel/Regularizer/mul/x:output:00net/general_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: i
IdentityIdentity+net/general_conv/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: ?
NoOpNoOp:^net/general_conv/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2v
9net/general_conv/kernel/Regularizer/Square/ReadVariableOp9net/general_conv/kernel/Regularizer/Square/ReadVariableOp
?
?
P__inference_batch_normalization_layer_call_and_return_conditional_losses_6693029

inputs/
!batchnorm_readvariableop_resource: 3
%batchnorm_mul_readvariableop_resource: 1
#batchnorm_readvariableop_1_resource: 1
#batchnorm_readvariableop_2_resource: 
identity??batchnorm/ReadVariableOp?batchnorm/ReadVariableOp_1?batchnorm/ReadVariableOp_2?batchnorm/mul/ReadVariableOpv
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o?:w
batchnorm/addAddV2 batchnorm/ReadVariableOp:value:0batchnorm/add/y:output:0*
T0*
_output_shapes
: P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
: ~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
: c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:????????? z
batchnorm/ReadVariableOp_1ReadVariableOp#batchnorm_readvariableop_1_resource*
_output_shapes
: *
dtype0r
batchnorm/mul_2Mul"batchnorm/ReadVariableOp_1:value:0batchnorm/mul:z:0*
T0*
_output_shapes
: z
batchnorm/ReadVariableOp_2ReadVariableOp#batchnorm_readvariableop_2_resource*
_output_shapes
: *
dtype0r
batchnorm/subSub"batchnorm/ReadVariableOp_2:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
: r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:????????? b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:????????? ?
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/ReadVariableOp_1^batchnorm/ReadVariableOp_2^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:????????? : : : : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp28
batchnorm/ReadVariableOp_1batchnorm/ReadVariableOp_128
batchnorm/ReadVariableOp_2batchnorm/ReadVariableOp_22<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:????????? 
 
_user_specified_nameinputs
?%
?
P__inference_batch_normalization_layer_call_and_return_conditional_losses_6693076

inputs5
'assignmovingavg_readvariableop_resource: 7
)assignmovingavg_1_readvariableop_resource: 3
%batchnorm_mul_readvariableop_resource: /
!batchnorm_readvariableop_resource: 
identity??AssignMovingAvg?AssignMovingAvg/ReadVariableOp?AssignMovingAvg_1? AssignMovingAvg_1/ReadVariableOp?batchnorm/ReadVariableOp?batchnorm/mul/ReadVariableOph
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: 
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*
_output_shapes

: *
	keep_dims(d
moments/StopGradientStopGradientmoments/mean:output:0*
T0*
_output_shapes

: ?
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*'
_output_shapes
:????????? l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB: ?
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*
_output_shapes

: *
	keep_dims(m
moments/SqueezeSqueezemoments/mean:output:0*
T0*
_output_shapes
: *
squeeze_dims
 s
moments/Squeeze_1Squeezemoments/variance:output:0*
T0*
_output_shapes
: *
squeeze_dims
 Z
AssignMovingAvg/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
AssignMovingAvg/ReadVariableOpReadVariableOp'assignmovingavg_readvariableop_resource*
_output_shapes
: *
dtype0?
AssignMovingAvg/subSub&AssignMovingAvg/ReadVariableOp:value:0moments/Squeeze:output:0*
T0*
_output_shapes
: x
AssignMovingAvg/mulMulAssignMovingAvg/sub:z:0AssignMovingAvg/decay:output:0*
T0*
_output_shapes
: ?
AssignMovingAvgAssignSubVariableOp'assignmovingavg_readvariableop_resourceAssignMovingAvg/mul:z:0^AssignMovingAvg/ReadVariableOp*
_output_shapes
 *
dtype0\
AssignMovingAvg_1/decayConst*
_output_shapes
: *
dtype0*
valueB
 *
?#<?
 AssignMovingAvg_1/ReadVariableOpReadVariableOp)assignmovingavg_1_readvariableop_resource*
_output_shapes
: *
dtype0?
AssignMovingAvg_1/subSub(AssignMovingAvg_1/ReadVariableOp:value:0moments/Squeeze_1:output:0*
T0*
_output_shapes
: ~
AssignMovingAvg_1/mulMulAssignMovingAvg_1/sub:z:0 AssignMovingAvg_1/decay:output:0*
T0*
_output_shapes
: ?
AssignMovingAvg_1AssignSubVariableOp)assignmovingavg_1_readvariableop_resourceAssignMovingAvg_1/mul:z:0!^AssignMovingAvg_1/ReadVariableOp*
_output_shapes
 *
dtype0T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o?:q
batchnorm/addAddV2moments/Squeeze_1:output:0batchnorm/add/y:output:0*
T0*
_output_shapes
: P
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*
_output_shapes
: ~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0t
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
: c
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*'
_output_shapes
:????????? h
batchnorm/mul_2Mulmoments/Squeeze:output:0batchnorm/mul:z:0*
T0*
_output_shapes
: v
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0p
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*
_output_shapes
: r
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*'
_output_shapes
:????????? b
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*'
_output_shapes
:????????? ?
NoOpNoOp^AssignMovingAvg^AssignMovingAvg/ReadVariableOp^AssignMovingAvg_1!^AssignMovingAvg_1/ReadVariableOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:????????? : : : : 2"
AssignMovingAvgAssignMovingAvg2@
AssignMovingAvg/ReadVariableOpAssignMovingAvg/ReadVariableOp2&
AssignMovingAvg_1AssignMovingAvg_12D
 AssignMovingAvg_1/ReadVariableOp AssignMovingAvg_1/ReadVariableOp24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:O K
'
_output_shapes
:????????? 
 
_user_specified_nameinputs
?
?
D__inference_dense_1_layer_call_and_return_conditional_losses_6694474

inputs2
matmul_readvariableop_resource:
??.
biasadd_readvariableop_resource:	?
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?4net/dense_1/kernel/Regularizer/Square/ReadVariableOpv
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
4net/dense_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
%net/dense_1/kernel/Regularizer/SquareSquare<net/dense_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
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
:???????????
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp5^net/dense_1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:??????????: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2l
4net/dense_1/kernel/Regularizer/Square/ReadVariableOp4net/dense_1/kernel/Regularizer/Square/ReadVariableOp:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?3
?
#__inference__traced_restore_6694739
file_prefix:
(assignvariableop_net_general_conv_kernel: 6
(assignvariableop_1_net_general_conv_bias: 7
#assignvariableop_2_net_dense_kernel:
??0
!assignvariableop_3_net_dense_bias:	?9
%assignvariableop_4_net_dense_1_kernel:
??2
#assignvariableop_5_net_dense_1_bias:	?8
%assignvariableop_6_net_dense_2_kernel:	?1
#assignvariableop_7_net_dense_2_bias:K
=assignvariableop_8_net_general_conv_batch_normalization_gamma: J
<assignvariableop_9_net_general_conv_batch_normalization_beta: R
Dassignvariableop_10_net_general_conv_batch_normalization_moving_mean: V
Hassignvariableop_11_net_general_conv_batch_normalization_moving_variance: 
identity_13??AssignVariableOp?AssignVariableOp_1?AssignVariableOp_10?AssignVariableOp_11?AssignVariableOp_2?AssignVariableOp_3?AssignVariableOp_4?AssignVariableOp_5?AssignVariableOp_6?AssignVariableOp_7?AssignVariableOp_8?AssignVariableOp_9?
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*?
value?B?B'conv1/kernel/.ATTRIBUTES/VARIABLE_VALUEB%conv1/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense1/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense1/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense2/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense2/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense3/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense3/bias/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH?
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*-
value$B"B B B B B B B B B B B B B ?
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*H
_output_shapes6
4:::::::::::::*
dtypes
2[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOpAssignVariableOp(assignvariableop_net_general_conv_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_1AssignVariableOp(assignvariableop_1_net_general_conv_biasIdentity_1:output:0"/device:CPU:0*
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
AssignVariableOp_8AssignVariableOp=assignvariableop_8_net_general_conv_batch_normalization_gammaIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_9AssignVariableOp<assignvariableop_9_net_general_conv_batch_normalization_betaIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_10AssignVariableOpDassignvariableop_10_net_general_conv_batch_normalization_moving_meanIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:?
AssignVariableOp_11AssignVariableOpHassignvariableop_11_net_general_conv_batch_normalization_moving_varianceIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 ?
Identity_12Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_13IdentityIdentity_12:output:0^NoOp_1*
T0*
_output_shapes
: ?
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_13Identity_13:output:0*-
_input_shapes
: : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112(
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
?$
?
 __inference__traced_save_6694693
file_prefix6
2savev2_net_general_conv_kernel_read_readvariableop4
0savev2_net_general_conv_bias_read_readvariableop/
+savev2_net_dense_kernel_read_readvariableop-
)savev2_net_dense_bias_read_readvariableop1
-savev2_net_dense_1_kernel_read_readvariableop/
+savev2_net_dense_1_bias_read_readvariableop1
-savev2_net_dense_2_kernel_read_readvariableop/
+savev2_net_dense_2_bias_read_readvariableopI
Esavev2_net_general_conv_batch_normalization_gamma_read_readvariableopH
Dsavev2_net_general_conv_batch_normalization_beta_read_readvariableopO
Ksavev2_net_general_conv_batch_normalization_moving_mean_read_readvariableopS
Osavev2_net_general_conv_batch_normalization_moving_variance_read_readvariableop
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
:*
dtype0*?
value?B?B'conv1/kernel/.ATTRIBUTES/VARIABLE_VALUEB%conv1/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense1/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense1/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense2/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense2/bias/.ATTRIBUTES/VARIABLE_VALUEB(dense3/kernel/.ATTRIBUTES/VARIABLE_VALUEB&dense3/bias/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH?
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*-
value$B"B B B B B B B B B B B B B ?
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:02savev2_net_general_conv_kernel_read_readvariableop0savev2_net_general_conv_bias_read_readvariableop+savev2_net_dense_kernel_read_readvariableop)savev2_net_dense_bias_read_readvariableop-savev2_net_dense_1_kernel_read_readvariableop+savev2_net_dense_1_bias_read_readvariableop-savev2_net_dense_2_kernel_read_readvariableop+savev2_net_dense_2_bias_read_readvariableopEsavev2_net_general_conv_batch_normalization_gamma_read_readvariableopDsavev2_net_general_conv_batch_normalization_beta_read_readvariableopKsavev2_net_general_conv_batch_normalization_moving_mean_read_readvariableopOsavev2_net_general_conv_batch_normalization_moving_variance_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *
dtypes
2?
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

identity_1Identity_1:output:0*v
_input_shapese
c: : : :
??:?:
??:?:	?:: : : : : 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:$ 

_output_shapes

: : 

_output_shapes
: :&"
 
_output_shapes
:
??:!

_output_shapes	
:?:&"
 
_output_shapes
:
??:!

_output_shapes	
:?:%!

_output_shapes
:	?: 

_output_shapes
:: 	

_output_shapes
: : 


_output_shapes
: : 

_output_shapes
: : 

_output_shapes
: :

_output_shapes
: 
?
?
%__inference_signature_wrapper_6693891

args_0
args_0_1	
args_0_2
args_0_3	
args_0_4	
unknown: 
	unknown_0: 
	unknown_1: 
	unknown_2: 
	unknown_3: 
	unknown_4: 
	unknown_5:
??
	unknown_6:	?
	unknown_7:
??
	unknown_8:	?
	unknown_9:	?

unknown_10:
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallargs_0args_0_1args_0_2args_0_3args_0_4unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2			*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:?????????*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8? *+
f&R$
"__inference__wrapped_model_6693005o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:?????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*u
_input_shapesd
b:?????????:?????????:?????????::?????????: : : : : : : : : : : : 22
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
?
b
D__inference_dropout_layer_call_and_return_conditional_losses_6694387

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:??????????\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:??????????"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:??????????:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
__inference_loss_fn_2_6694539Q
=net_dense_1_kernel_regularizer_square_readvariableop_resource:
??
identity??4net/dense_1/kernel/Regularizer/Square/ReadVariableOp?
4net/dense_1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp=net_dense_1_kernel_regularizer_square_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
%net/dense_1/kernel/Regularizer/SquareSquare<net/dense_1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0* 
_output_shapes
:
??u
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
?	
c
D__inference_dropout_layer_call_and_return_conditional_losses_6693354

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
:??????????C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:?
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:??????????*
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
:??????????p
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:??????????j
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:??????????Z
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:??????????"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:??????????:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
b
)__inference_dropout_layer_call_fn_6694382

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
:??????????* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8? *M
fHRF
D__inference_dropout_layer_call_and_return_conditional_losses_6693354p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:??????????`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:??????????22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
.__inference_general_conv_layer_call_fn_6694233
inputs_0

inputs	
inputs_1
inputs_2	
unknown: 
	unknown_0: 
	unknown_1: 
	unknown_2: 
	unknown_3: 
	unknown_4: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputsinputs_1inputs_2unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
2
		*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:????????? *(
_read_only_resource_inputs

	*0
config_proto 

CPU

GPU2*0J 8? *R
fMRK
I__inference_general_conv_layer_call_and_return_conditional_losses_6693157o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:????????? `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:?????????:?????????:?????????:: : : : : : 22
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
??
?
I__inference_general_conv_layer_call_and_return_conditional_losses_6694306
inputs_0

inputs	
inputs_1
inputs_2	0
matmul_readvariableop_resource: -
biasadd_readvariableop_resource: C
5batch_normalization_batchnorm_readvariableop_resource: G
9batch_normalization_batchnorm_mul_readvariableop_resource: E
7batch_normalization_batchnorm_readvariableop_1_resource: E
7batch_normalization_batchnorm_readvariableop_2_resource: 
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?,batch_normalization/batchnorm/ReadVariableOp?.batch_normalization/batchnorm/ReadVariableOp_1?.batch_normalization/batchnorm/ReadVariableOp_2?0batch_normalization/batchnorm/mul/ReadVariableOp?9net/general_conv/kernel/Regularizer/Square/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype0k
MatMulMatMulinputs_0MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? ?
,batch_normalization/batchnorm/ReadVariableOpReadVariableOp5batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0h
#batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o?:?
!batch_normalization/batchnorm/addAddV24batch_normalization/batchnorm/ReadVariableOp:value:0,batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes
: x
#batch_normalization/batchnorm/RsqrtRsqrt%batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes
: ?
0batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0?
!batch_normalization/batchnorm/mulMul'batch_normalization/batchnorm/Rsqrt:y:08batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
: ?
#batch_normalization/batchnorm/mul_1MulBiasAdd:output:0%batch_normalization/batchnorm/mul:z:0*
T0*'
_output_shapes
:????????? ?
.batch_normalization/batchnorm/ReadVariableOp_1ReadVariableOp7batch_normalization_batchnorm_readvariableop_1_resource*
_output_shapes
: *
dtype0?
#batch_normalization/batchnorm/mul_2Mul6batch_normalization/batchnorm/ReadVariableOp_1:value:0%batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes
: ?
.batch_normalization/batchnorm/ReadVariableOp_2ReadVariableOp7batch_normalization_batchnorm_readvariableop_2_resource*
_output_shapes
: *
dtype0?
!batch_normalization/batchnorm/subSub6batch_normalization/batchnorm/ReadVariableOp_2:value:0'batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes
: ?
#batch_normalization/batchnorm/add_1AddV2'batch_normalization/batchnorm/mul_1:z:0%batch_normalization/batchnorm/sub:z:0*
T0*'
_output_shapes
:????????? y
dropout_1/IdentityIdentity'batch_normalization/batchnorm/add_1:z:0*
T0*'
_output_shapes
:????????? Y
EluEludropout_1/Identity:output:0*
T0*'
_output_shapes
:????????? F
ShapeShapeElu:activations:0*
T0*
_output_shapes
:f
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????h
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?????????_
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
shrink_axis_maskf
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_1StridedSliceinputsstrided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskf
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        h
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_2StridedSliceinputsstrided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskX
GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
GatherV2GatherV2Elu:activations:0strided_slice_2:output:0GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:????????? ?
UnsortedSegmentSumUnsortedSegmentSumGatherV2:output:0strided_slice_1:output:0strided_slice:output:0*
T0*
Tindices0	*'
_output_shapes
:????????? ?
9net/general_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype0?
*net/general_conv/kernel/Regularizer/SquareSquareAnet/general_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: z
)net/general_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
'net/general_conv/kernel/Regularizer/SumSum.net/general_conv/kernel/Regularizer/Square:y:02net/general_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: n
)net/general_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
'net/general_conv/kernel/Regularizer/mulMul2net/general_conv/kernel/Regularizer/mul/x:output:00net/general_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: j
IdentityIdentityUnsortedSegmentSum:output:0^NoOp*
T0*'
_output_shapes
:????????? ?
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp-^batch_normalization/batchnorm/ReadVariableOp/^batch_normalization/batchnorm/ReadVariableOp_1/^batch_normalization/batchnorm/ReadVariableOp_21^batch_normalization/batchnorm/mul/ReadVariableOp:^net/general_conv/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:?????????:?????????:?????????:: : : : : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2\
,batch_normalization/batchnorm/ReadVariableOp,batch_normalization/batchnorm/ReadVariableOp2`
.batch_normalization/batchnorm/ReadVariableOp_1.batch_normalization/batchnorm/ReadVariableOp_12`
.batch_normalization/batchnorm/ReadVariableOp_2.batch_normalization/batchnorm/ReadVariableOp_22d
0batch_normalization/batchnorm/mul/ReadVariableOp0batch_normalization/batchnorm/mul/ReadVariableOp2v
9net/general_conv/kernel/Regularizer/Square/ReadVariableOp9net/general_conv/kernel/Regularizer/Square/ReadVariableOp:Q M
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
?r
?
"__inference__wrapped_model_6693005

args_0
args_0_1	
args_0_2
args_0_3	
args_0_4	A
/net_general_conv_matmul_readvariableop_resource: >
0net_general_conv_biasadd_readvariableop_resource: T
Fnet_general_conv_batch_normalization_batchnorm_readvariableop_resource: X
Jnet_general_conv_batch_normalization_batchnorm_mul_readvariableop_resource: V
Hnet_general_conv_batch_normalization_batchnorm_readvariableop_1_resource: V
Hnet_general_conv_batch_normalization_batchnorm_readvariableop_2_resource: <
(net_dense_matmul_readvariableop_resource:
??8
)net_dense_biasadd_readvariableop_resource:	?>
*net_dense_1_matmul_readvariableop_resource:
??:
+net_dense_1_biasadd_readvariableop_resource:	?=
*net_dense_2_matmul_readvariableop_resource:	?9
+net_dense_2_biasadd_readvariableop_resource:
identity?? net/dense/BiasAdd/ReadVariableOp?net/dense/MatMul/ReadVariableOp?"net/dense_1/BiasAdd/ReadVariableOp?!net/dense_1/MatMul/ReadVariableOp?"net/dense_2/BiasAdd/ReadVariableOp?!net/dense_2/MatMul/ReadVariableOp?'net/general_conv/BiasAdd/ReadVariableOp?&net/general_conv/MatMul/ReadVariableOp?=net/general_conv/batch_normalization/batchnorm/ReadVariableOp??net/general_conv/batch_normalization/batchnorm/ReadVariableOp_1??net/general_conv/batch_normalization/batchnorm/ReadVariableOp_2?Anet/general_conv/batch_normalization/batchnorm/mul/ReadVariableOpY
net/CastCastargs_0*

DstT0*

SrcT0*'
_output_shapes
:?????????l
net/general_conv/CastCastnet/Cast:y:0*

DstT0*

SrcT0*'
_output_shapes
:??????????
&net/general_conv/MatMul/ReadVariableOpReadVariableOp/net_general_conv_matmul_readvariableop_resource*
_output_shapes

: *
dtype0?
net/general_conv/MatMulMatMulnet/general_conv/Cast:y:0.net/general_conv/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? ?
'net/general_conv/BiasAdd/ReadVariableOpReadVariableOp0net_general_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0?
net/general_conv/BiasAddBiasAdd!net/general_conv/MatMul:product:0/net/general_conv/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? ?
=net/general_conv/batch_normalization/batchnorm/ReadVariableOpReadVariableOpFnet_general_conv_batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0y
4net/general_conv/batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o?:?
2net/general_conv/batch_normalization/batchnorm/addAddV2Enet/general_conv/batch_normalization/batchnorm/ReadVariableOp:value:0=net/general_conv/batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes
: ?
4net/general_conv/batch_normalization/batchnorm/RsqrtRsqrt6net/general_conv/batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes
: ?
Anet/general_conv/batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOpJnet_general_conv_batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0?
2net/general_conv/batch_normalization/batchnorm/mulMul8net/general_conv/batch_normalization/batchnorm/Rsqrt:y:0Inet/general_conv/batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
: ?
4net/general_conv/batch_normalization/batchnorm/mul_1Mul!net/general_conv/BiasAdd:output:06net/general_conv/batch_normalization/batchnorm/mul:z:0*
T0*'
_output_shapes
:????????? ?
?net/general_conv/batch_normalization/batchnorm/ReadVariableOp_1ReadVariableOpHnet_general_conv_batch_normalization_batchnorm_readvariableop_1_resource*
_output_shapes
: *
dtype0?
4net/general_conv/batch_normalization/batchnorm/mul_2MulGnet/general_conv/batch_normalization/batchnorm/ReadVariableOp_1:value:06net/general_conv/batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes
: ?
?net/general_conv/batch_normalization/batchnorm/ReadVariableOp_2ReadVariableOpHnet_general_conv_batch_normalization_batchnorm_readvariableop_2_resource*
_output_shapes
: *
dtype0?
2net/general_conv/batch_normalization/batchnorm/subSubGnet/general_conv/batch_normalization/batchnorm/ReadVariableOp_2:value:08net/general_conv/batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes
: ?
4net/general_conv/batch_normalization/batchnorm/add_1AddV28net/general_conv/batch_normalization/batchnorm/mul_1:z:06net/general_conv/batch_normalization/batchnorm/sub:z:0*
T0*'
_output_shapes
:????????? ?
#net/general_conv/dropout_1/IdentityIdentity8net/general_conv/batch_normalization/batchnorm/add_1:z:0*
T0*'
_output_shapes
:????????? {
net/general_conv/EluElu,net/general_conv/dropout_1/Identity:output:0*
T0*'
_output_shapes
:????????? h
net/general_conv/ShapeShape"net/general_conv/Elu:activations:0*
T0*
_output_shapes
:w
$net/general_conv/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????y
&net/general_conv/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?????????p
&net/general_conv/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:?
net/general_conv/strided_sliceStridedSlicenet/general_conv/Shape:output:0-net/general_conv/strided_slice/stack:output:0/net/general_conv/strided_slice/stack_1:output:0/net/general_conv/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskw
&net/general_conv/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       y
(net/general_conv/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       y
(net/general_conv/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
 net/general_conv/strided_slice_1StridedSliceargs_0_1/net/general_conv/strided_slice_1/stack:output:01net/general_conv/strided_slice_1/stack_1:output:01net/general_conv/strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskw
&net/general_conv/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        y
(net/general_conv/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       y
(net/general_conv/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
 net/general_conv/strided_slice_2StridedSliceargs_0_1/net/general_conv/strided_slice_2/stack:output:01net/general_conv/strided_slice_2/stack_1:output:01net/general_conv/strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maski
net/general_conv/GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
net/general_conv/GatherV2GatherV2"net/general_conv/Elu:activations:0)net/general_conv/strided_slice_2:output:0'net/general_conv/GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:????????? ?
#net/general_conv/UnsortedSegmentSumUnsortedSegmentSum"net/general_conv/GatherV2:output:0)net/general_conv/strided_slice_1:output:0'net/general_conv/strided_slice:output:0*
T0*
Tindices0	*'
_output_shapes
:????????? e
	net/ShapeShape,net/general_conv/UnsortedSegmentSum:output:0*
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
shrink_axis_maskO
net/truediv/yConst*
_output_shapes
: *
dtype0*
value	B :dd
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
valueB 2      Y@\
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
: W
net/Reshape/shape_1/1Const*
_output_shapes
: *
dtype0*
value	B :dW
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
net/ReshapeReshape,net/general_conv/UnsortedSegmentSum:output:0net/Reshape/shape_1:output:0*
T0*+
_output_shapes
:?????????d b
net/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"?????  ?
net/flatten/ReshapeReshapenet/Reshape:output:0net/flatten/Const:output:0*
T0*(
_output_shapes
:???????????
net/dense/MatMul/ReadVariableOpReadVariableOp(net_dense_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
net/dense/MatMulMatMulnet/flatten/Reshape:output:0'net/dense/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
 net/dense/BiasAdd/ReadVariableOpReadVariableOp)net_dense_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
net/dense/BiasAddBiasAddnet/dense/MatMul:product:0(net/dense/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????e
net/dense/ReluRelunet/dense/BiasAdd:output:0*
T0*(
_output_shapes
:???????????
!net/dense_1/MatMul/ReadVariableOpReadVariableOp*net_dense_1_matmul_readvariableop_resource* 
_output_shapes
:
??*
dtype0?
net/dense_1/MatMulMatMulnet/dense/Relu:activations:0)net/dense_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:???????????
"net/dense_1/BiasAdd/ReadVariableOpReadVariableOp+net_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:?*
dtype0?
net/dense_1/BiasAddBiasAddnet/dense_1/MatMul:product:0*net/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:??????????i
net/dense_1/ReluRelunet/dense_1/BiasAdd:output:0*
T0*(
_output_shapes
:??????????s
net/dropout/IdentityIdentitynet/dense_1/Relu:activations:0*
T0*(
_output_shapes
:???????????
!net/dense_2/MatMul/ReadVariableOpReadVariableOp*net_dense_2_matmul_readvariableop_resource*
_output_shapes
:	?*
dtype0?
net/dense_2/MatMulMatMulnet/dropout/Identity:output:0)net/dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:??????????
"net/dense_2/BiasAdd/ReadVariableOpReadVariableOp+net_dense_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0?
net/dense_2/BiasAddBiasAddnet/dense_2/MatMul:product:0*net/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:?????????n
net/dense_2/SigmoidSigmoidnet/dense_2/BiasAdd:output:0*
T0*'
_output_shapes
:?????????f
IdentityIdentitynet/dense_2/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:??????????
NoOpNoOp!^net/dense/BiasAdd/ReadVariableOp ^net/dense/MatMul/ReadVariableOp#^net/dense_1/BiasAdd/ReadVariableOp"^net/dense_1/MatMul/ReadVariableOp#^net/dense_2/BiasAdd/ReadVariableOp"^net/dense_2/MatMul/ReadVariableOp(^net/general_conv/BiasAdd/ReadVariableOp'^net/general_conv/MatMul/ReadVariableOp>^net/general_conv/batch_normalization/batchnorm/ReadVariableOp@^net/general_conv/batch_normalization/batchnorm/ReadVariableOp_1@^net/general_conv/batch_normalization/batchnorm/ReadVariableOp_2B^net/general_conv/batch_normalization/batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*u
_input_shapesd
b:?????????:?????????:?????????::?????????: : : : : : : : : : : : 2D
 net/dense/BiasAdd/ReadVariableOp net/dense/BiasAdd/ReadVariableOp2B
net/dense/MatMul/ReadVariableOpnet/dense/MatMul/ReadVariableOp2H
"net/dense_1/BiasAdd/ReadVariableOp"net/dense_1/BiasAdd/ReadVariableOp2F
!net/dense_1/MatMul/ReadVariableOp!net/dense_1/MatMul/ReadVariableOp2H
"net/dense_2/BiasAdd/ReadVariableOp"net/dense_2/BiasAdd/ReadVariableOp2F
!net/dense_2/MatMul/ReadVariableOp!net/dense_2/MatMul/ReadVariableOp2R
'net/general_conv/BiasAdd/ReadVariableOp'net/general_conv/BiasAdd/ReadVariableOp2P
&net/general_conv/MatMul/ReadVariableOp&net/general_conv/MatMul/ReadVariableOp2~
=net/general_conv/batch_normalization/batchnorm/ReadVariableOp=net/general_conv/batch_normalization/batchnorm/ReadVariableOp2?
?net/general_conv/batch_normalization/batchnorm/ReadVariableOp_1?net/general_conv/batch_normalization/batchnorm/ReadVariableOp_12?
?net/general_conv/batch_normalization/batchnorm/ReadVariableOp_2?net/general_conv/batch_normalization/batchnorm/ReadVariableOp_22?
Anet/general_conv/batch_normalization/batchnorm/mul/ReadVariableOpAnet/general_conv/batch_normalization/batchnorm/mul/ReadVariableOp:O K
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
?
b
D__inference_dropout_layer_call_and_return_conditional_losses_6693247

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:??????????\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:??????????"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:??????????:P L
(
_output_shapes
:??????????
 
_user_specified_nameinputs
?
?
5__inference_batch_normalization_layer_call_fn_6694576

inputs
unknown: 
	unknown_0: 
	unknown_1: 
	unknown_2: 
identity??StatefulPartitionedCall?
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:????????? *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8? *Y
fTRR
P__inference_batch_normalization_layer_call_and_return_conditional_losses_6693076o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:????????? `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:????????? : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:????????? 
 
_user_specified_nameinputs
??
?
I__inference_general_conv_layer_call_and_return_conditional_losses_6693157

inputs
inputs_1	
inputs_2
inputs_3	0
matmul_readvariableop_resource: -
biasadd_readvariableop_resource: C
5batch_normalization_batchnorm_readvariableop_resource: G
9batch_normalization_batchnorm_mul_readvariableop_resource: E
7batch_normalization_batchnorm_readvariableop_1_resource: E
7batch_normalization_batchnorm_readvariableop_2_resource: 
identity??BiasAdd/ReadVariableOp?MatMul/ReadVariableOp?,batch_normalization/batchnorm/ReadVariableOp?.batch_normalization/batchnorm/ReadVariableOp_1?.batch_normalization/batchnorm/ReadVariableOp_2?0batch_normalization/batchnorm/mul/ReadVariableOp?9net/general_conv/kernel/Regularizer/Square/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:????????? ?
,batch_normalization/batchnorm/ReadVariableOpReadVariableOp5batch_normalization_batchnorm_readvariableop_resource*
_output_shapes
: *
dtype0h
#batch_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *o?:?
!batch_normalization/batchnorm/addAddV24batch_normalization/batchnorm/ReadVariableOp:value:0,batch_normalization/batchnorm/add/y:output:0*
T0*
_output_shapes
: x
#batch_normalization/batchnorm/RsqrtRsqrt%batch_normalization/batchnorm/add:z:0*
T0*
_output_shapes
: ?
0batch_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9batch_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
: *
dtype0?
!batch_normalization/batchnorm/mulMul'batch_normalization/batchnorm/Rsqrt:y:08batch_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*
_output_shapes
: ?
#batch_normalization/batchnorm/mul_1MulBiasAdd:output:0%batch_normalization/batchnorm/mul:z:0*
T0*'
_output_shapes
:????????? ?
.batch_normalization/batchnorm/ReadVariableOp_1ReadVariableOp7batch_normalization_batchnorm_readvariableop_1_resource*
_output_shapes
: *
dtype0?
#batch_normalization/batchnorm/mul_2Mul6batch_normalization/batchnorm/ReadVariableOp_1:value:0%batch_normalization/batchnorm/mul:z:0*
T0*
_output_shapes
: ?
.batch_normalization/batchnorm/ReadVariableOp_2ReadVariableOp7batch_normalization_batchnorm_readvariableop_2_resource*
_output_shapes
: *
dtype0?
!batch_normalization/batchnorm/subSub6batch_normalization/batchnorm/ReadVariableOp_2:value:0'batch_normalization/batchnorm/mul_2:z:0*
T0*
_output_shapes
: ?
#batch_normalization/batchnorm/add_1AddV2'batch_normalization/batchnorm/mul_1:z:0%batch_normalization/batchnorm/sub:z:0*
T0*'
_output_shapes
:????????? y
dropout_1/IdentityIdentity'batch_normalization/batchnorm/add_1:z:0*
T0*'
_output_shapes
:????????? Y
EluEludropout_1/Identity:output:0*
T0*'
_output_shapes
:????????? F
ShapeShapeElu:activations:0*
T0*
_output_shapes
:f
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:
?????????h
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:
?????????_
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
shrink_axis_maskf
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_1StridedSliceinputs_1strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskf
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB"        h
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB"       h
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB"      ?
strided_slice_2StridedSliceinputs_1strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0	*#
_output_shapes
:?????????*

begin_mask*
end_mask*
shrink_axis_maskX
GatherV2/axisConst*
_output_shapes
: *
dtype0*
valueB :
??????????
GatherV2GatherV2Elu:activations:0strided_slice_2:output:0GatherV2/axis:output:0*
Taxis0*
Tindices0	*
Tparams0*'
_output_shapes
:????????? ?
UnsortedSegmentSumUnsortedSegmentSumGatherV2:output:0strided_slice_1:output:0strided_slice:output:0*
T0*
Tindices0	*'
_output_shapes
:????????? ?
9net/general_conv/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype0?
*net/general_conv/kernel/Regularizer/SquareSquareAnet/general_conv/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: z
)net/general_conv/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ?
'net/general_conv/kernel/Regularizer/SumSum.net/general_conv/kernel/Regularizer/Square:y:02net/general_conv/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: n
)net/general_conv/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *o:?
'net/general_conv/kernel/Regularizer/mulMul2net/general_conv/kernel/Regularizer/mul/x:output:00net/general_conv/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: j
IdentityIdentityUnsortedSegmentSum:output:0^NoOp*
T0*'
_output_shapes
:????????? ?
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp-^batch_normalization/batchnorm/ReadVariableOp/^batch_normalization/batchnorm/ReadVariableOp_1/^batch_normalization/batchnorm/ReadVariableOp_21^batch_normalization/batchnorm/mul/ReadVariableOp:^net/general_conv/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:?????????:?????????:?????????:: : : : : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2\
,batch_normalization/batchnorm/ReadVariableOp,batch_normalization/batchnorm/ReadVariableOp2`
.batch_normalization/batchnorm/ReadVariableOp_1.batch_normalization/batchnorm/ReadVariableOp_12`
.batch_normalization/batchnorm/ReadVariableOp_2.batch_normalization/batchnorm/ReadVariableOp_22d
0batch_normalization/batchnorm/mul/ReadVariableOp0batch_normalization/batchnorm/mul/ReadVariableOp2v
9net/general_conv/kernel/Regularizer/Square/ReadVariableOp9net/general_conv/kernel/Regularizer/Square/ReadVariableOp:O K
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
	conv1
	conv2
dropout
flatten

dense1

dense2

dense3
	variables
	trainable_variables

regularization_losses
	keras_api

signatures
l__call__
*m&call_and_return_all_conditional_losses
n_default_save_signature"
_tf_keras_model
?
kwargs_keys
dropout

batch_norm

kernel
bias
	variables
trainable_variables
regularization_losses
	keras_api
o__call__
*p&call_and_return_all_conditional_losses"
_tf_keras_layer
9
kwargs_keys
	keras_api"
_tf_keras_layer
?
	variables
trainable_variables
regularization_losses
	keras_api
q__call__
*r&call_and_return_all_conditional_losses"
_tf_keras_layer
?
	variables
trainable_variables
regularization_losses
	keras_api
s__call__
*t&call_and_return_all_conditional_losses"
_tf_keras_layer
?

 kernel
!bias
"	variables
#trainable_variables
$regularization_losses
%	keras_api
u__call__
*v&call_and_return_all_conditional_losses"
_tf_keras_layer
?

&kernel
'bias
(	variables
)trainable_variables
*regularization_losses
+	keras_api
w__call__
*x&call_and_return_all_conditional_losses"
_tf_keras_layer
?

,kernel
-bias
.	variables
/trainable_variables
0regularization_losses
1	keras_api
y__call__
*z&call_and_return_all_conditional_losses"
_tf_keras_layer
v
0
1
22
33
44
55
 6
!7
&8
'9
,10
-11"
trackable_list_wrapper
f
0
1
22
33
 4
!5
&6
'7
,8
-9"
trackable_list_wrapper
<
{0
|1
}2
~3"
trackable_list_wrapper
?
6non_trainable_variables

7layers
8metrics
9layer_regularization_losses
:layer_metrics
	variables
	trainable_variables

regularization_losses
l__call__
n_default_save_signature
*m&call_and_return_all_conditional_losses
&m"call_and_return_conditional_losses"
_generic_user_object
,
serving_default"
signature_map
 "
trackable_list_wrapper
?
;	variables
<trainable_variables
=regularization_losses
>	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
?
?axis
	2gamma
3beta
4moving_mean
5moving_variance
@	variables
Atrainable_variables
Bregularization_losses
C	keras_api
?__call__
+?&call_and_return_all_conditional_losses"
_tf_keras_layer
):' 2net/general_conv/kernel
#:! 2net/general_conv/bias
J
0
1
22
33
44
55"
trackable_list_wrapper
<
0
1
22
33"
trackable_list_wrapper
'
{0"
trackable_list_wrapper
?
Dnon_trainable_variables

Elayers
Fmetrics
Glayer_regularization_losses
Hlayer_metrics
	variables
trainable_variables
regularization_losses
o__call__
*p&call_and_return_all_conditional_losses
&p"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
Inon_trainable_variables

Jlayers
Kmetrics
Llayer_regularization_losses
Mlayer_metrics
	variables
trainable_variables
regularization_losses
q__call__
*r&call_and_return_all_conditional_losses
&r"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
?
Nnon_trainable_variables

Olayers
Pmetrics
Qlayer_regularization_losses
Rlayer_metrics
	variables
trainable_variables
regularization_losses
s__call__
*t&call_and_return_all_conditional_losses
&t"call_and_return_conditional_losses"
_generic_user_object
$:"
??2net/dense/kernel
:?2net/dense/bias
.
 0
!1"
trackable_list_wrapper
.
 0
!1"
trackable_list_wrapper
'
|0"
trackable_list_wrapper
?
Snon_trainable_variables

Tlayers
Umetrics
Vlayer_regularization_losses
Wlayer_metrics
"	variables
#trainable_variables
$regularization_losses
u__call__
*v&call_and_return_all_conditional_losses
&v"call_and_return_conditional_losses"
_generic_user_object
&:$
??2net/dense_1/kernel
:?2net/dense_1/bias
.
&0
'1"
trackable_list_wrapper
.
&0
'1"
trackable_list_wrapper
'
}0"
trackable_list_wrapper
?
Xnon_trainable_variables

Ylayers
Zmetrics
[layer_regularization_losses
\layer_metrics
(	variables
)trainable_variables
*regularization_losses
w__call__
*x&call_and_return_all_conditional_losses
&x"call_and_return_conditional_losses"
_generic_user_object
%:#	?2net/dense_2/kernel
:2net/dense_2/bias
.
,0
-1"
trackable_list_wrapper
.
,0
-1"
trackable_list_wrapper
'
~0"
trackable_list_wrapper
?
]non_trainable_variables

^layers
_metrics
`layer_regularization_losses
alayer_metrics
.	variables
/trainable_variables
0regularization_losses
y__call__
*z&call_and_return_all_conditional_losses
&z"call_and_return_conditional_losses"
_generic_user_object
8:6 2*net/general_conv/batch_normalization/gamma
7:5 2)net/general_conv/batch_normalization/beta
@:>  (20net/general_conv/batch_normalization/moving_mean
D:B  (24net/general_conv/batch_normalization/moving_variance
.
40
51"
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
?
bnon_trainable_variables

clayers
dmetrics
elayer_regularization_losses
flayer_metrics
;	variables
<trainable_variables
=regularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
<
20
31
42
53"
trackable_list_wrapper
.
20
31"
trackable_list_wrapper
 "
trackable_list_wrapper
?
gnon_trainable_variables

hlayers
imetrics
jlayer_regularization_losses
klayer_metrics
@	variables
Atrainable_variables
Bregularization_losses
?__call__
+?&call_and_return_all_conditional_losses
'?"call_and_return_conditional_losses"
_generic_user_object
.
40
51"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
'
{0"
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
|0"
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
}0"
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
~0"
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
.
40
51"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
?2?
%__inference_net_layer_call_fn_6693924
%__inference_net_layer_call_fn_6693957?
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
@__inference_net_layer_call_and_return_conditional_losses_6694072
@__inference_net_layer_call_and_return_conditional_losses_6694207?
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
"__inference__wrapped_model_6693005args_0args_0_1args_0_2args_0_3args_0_4"?
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
?2?
.__inference_general_conv_layer_call_fn_6694233
.__inference_general_conv_layer_call_fn_6694253?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkwjkwargs
defaults? 

kwonlyargs?

jtraining%
kwonlydefaults?

trainingp 
annotations? *
 
?2?
I__inference_general_conv_layer_call_and_return_conditional_losses_6694306
I__inference_general_conv_layer_call_and_return_conditional_losses_6694372?
???
FullArgSpec
args?
jself
jinputs
varargs
 
varkwjkwargs
defaults? 

kwonlyargs?

jtraining%
kwonlydefaults?

trainingp 
annotations? *
 
?2?
)__inference_dropout_layer_call_fn_6694377
)__inference_dropout_layer_call_fn_6694382?
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
D__inference_dropout_layer_call_and_return_conditional_losses_6694387
D__inference_dropout_layer_call_and_return_conditional_losses_6694399?
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
)__inference_flatten_layer_call_fn_6694404?
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
D__inference_flatten_layer_call_and_return_conditional_losses_6694410?
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
'__inference_dense_layer_call_fn_6694425?
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
B__inference_dense_layer_call_and_return_conditional_losses_6694442?
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
)__inference_dense_1_layer_call_fn_6694457?
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
D__inference_dense_1_layer_call_and_return_conditional_losses_6694474?
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
)__inference_dense_2_layer_call_fn_6694489?
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
D__inference_dense_2_layer_call_and_return_conditional_losses_6694506?
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
__inference_loss_fn_0_6694517?
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
__inference_loss_fn_1_6694528?
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
__inference_loss_fn_2_6694539?
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
__inference_loss_fn_3_6694550?
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
%__inference_signature_wrapper_6693891args_0args_0_1args_0_2args_0_3args_0_4"?
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
 
?2??
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
?2??
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
5__inference_batch_normalization_layer_call_fn_6694563
5__inference_batch_normalization_layer_call_fn_6694576?
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
P__inference_batch_normalization_layer_call_and_return_conditional_losses_6694596
P__inference_batch_normalization_layer_call_and_return_conditional_losses_6694630?
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
 ?
"__inference__wrapped_model_6693005?5243 !&',-???
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
P__inference_batch_normalization_layer_call_and_return_conditional_losses_6694596b52433?0
)?&
 ?
inputs????????? 
p 
? "%?"
?
0????????? 
? ?
P__inference_batch_normalization_layer_call_and_return_conditional_losses_6694630b45233?0
)?&
 ?
inputs????????? 
p
? "%?"
?
0????????? 
? ?
5__inference_batch_normalization_layer_call_fn_6694563U52433?0
)?&
 ?
inputs????????? 
p 
? "?????????? ?
5__inference_batch_normalization_layer_call_fn_6694576U45233?0
)?&
 ?
inputs????????? 
p
? "?????????? ?
D__inference_dense_1_layer_call_and_return_conditional_losses_6694474^&'0?-
&?#
!?
inputs??????????
? "&?#
?
0??????????
? ~
)__inference_dense_1_layer_call_fn_6694457Q&'0?-
&?#
!?
inputs??????????
? "????????????
D__inference_dense_2_layer_call_and_return_conditional_losses_6694506],-0?-
&?#
!?
inputs??????????
? "%?"
?
0?????????
? }
)__inference_dense_2_layer_call_fn_6694489P,-0?-
&?#
!?
inputs??????????
? "???????????
B__inference_dense_layer_call_and_return_conditional_losses_6694442^ !0?-
&?#
!?
inputs??????????
? "&?#
?
0??????????
? |
'__inference_dense_layer_call_fn_6694425Q !0?-
&?#
!?
inputs??????????
? "????????????
D__inference_dropout_layer_call_and_return_conditional_losses_6694387^4?1
*?'
!?
inputs??????????
p 
? "&?#
?
0??????????
? ?
D__inference_dropout_layer_call_and_return_conditional_losses_6694399^4?1
*?'
!?
inputs??????????
p
? "&?#
?
0??????????
? ~
)__inference_dropout_layer_call_fn_6694377Q4?1
*?'
!?
inputs??????????
p 
? "???????????~
)__inference_dropout_layer_call_fn_6694382Q4?1
*?'
!?
inputs??????????
p
? "????????????
D__inference_flatten_layer_call_and_return_conditional_losses_6694410]3?0
)?&
$?!
inputs?????????d 
? "&?#
?
0??????????
? }
)__inference_flatten_layer_call_fn_6694404P3?0
)?&
$?!
inputs?????????d 
? "????????????
I__inference_general_conv_layer_call_and_return_conditional_losses_6694306?5243???
p?m
k?h
"?
inputs/0?????????
B??'?$
???????????????????
?SparseTensorSpec 
?

trainingp "%?"
?
0????????? 
? ?
I__inference_general_conv_layer_call_and_return_conditional_losses_6694372?4523???
p?m
k?h
"?
inputs/0?????????
B??'?$
???????????????????
?SparseTensorSpec 
?

trainingp"%?"
?
0????????? 
? ?
.__inference_general_conv_layer_call_fn_6694233?5243???
p?m
k?h
"?
inputs/0?????????
B??'?$
???????????????????
?SparseTensorSpec 
?

trainingp "?????????? ?
.__inference_general_conv_layer_call_fn_6694253?4523???
p?m
k?h
"?
inputs/0?????????
B??'?$
???????????????????
?SparseTensorSpec 
?

trainingp"?????????? <
__inference_loss_fn_0_6694517?

? 
? "? <
__inference_loss_fn_1_6694528 ?

? 
? "? <
__inference_loss_fn_2_6694539&?

? 
? "? <
__inference_loss_fn_3_6694550,?

? 
? "? ?
@__inference_net_layer_call_and_return_conditional_losses_6694072?5243 !&',-???
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
@__inference_net_layer_call_and_return_conditional_losses_6694207?4523 !&',-???
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
%__inference_net_layer_call_fn_6693924?5243 !&',-???
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
%__inference_net_layer_call_fn_6693957?4523 !&',-???
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
%__inference_signature_wrapper_6693891?5243 !&',-???
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