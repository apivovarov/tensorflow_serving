��
��
:
Add
x"T
y"T
z"T"
Ttype:
2	
x
Assign
ref"T�

value"T

output_ref"T�"	
Ttype"
validate_shapebool("
use_lockingbool(�
B
AssignVariableOp
resource
value"dtype"
dtypetype�
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
�
Conv2D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)"
use_cudnn_on_gpubool(""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

.
Identity

input"T
output"T"	
Ttype
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�
=
Mul
x"T
y"T
z"T"
Ttype:
2	�

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
�
ParseExample

serialized	
names
sparse_keys*Nsparse

dense_keys*Ndense
dense_defaults2Tdense
sparse_indices	*Nsparse
sparse_values2sparse_types
sparse_shapes	*Nsparse
dense_values2Tdense"
Nsparseint("
Ndenseint("%
sparse_types
list(type)(:
2	"
Tdense
list(type)(:
2	"
dense_shapeslist(shape)(
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
X
PlaceholderWithDefault
input"dtype
output"dtype"
dtypetype"
shapeshape
~
RandomUniform

shape"T
output"dtype"
seedint "
seed2int "
dtypetype:
2"
Ttype:
2	�
@
ReadVariableOp
resource
value"dtype"
dtypetype�
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
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
H
ShardedFilename
basename	
shard

num_shards
filename
�
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
:
Sub
x"T
y"T
z"T"
Ttype:
2	
q
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape�
9
VarIsInitializedOp
resource
is_initialized
�
s

VariableV2
ref"dtype�"
shapeshape"
dtypetype"
	containerstring "
shared_namestring �"serve*
1.12.0-rc02b'v1.12.0-rc0-2760-g5e1ab96'��
c
a/initial_valueConst"/device:CPU:0*
valueB
 *   ?*
dtype0*
_output_shapes
: 
t
a
VariableV2"/device:CPU:0*
dtype0*
_output_shapes
: *
	container *
shape: *
shared_name 
�
a/AssignAssignaa/initial_value"/device:CPU:0*
use_locking(*
T0*
_class

loc:@a*
validate_shape(*
_output_shapes
: 
[
a/readIdentitya"/device:CPU:0*
T0*
_class

loc:@a*
_output_shapes
: 
c
b/initial_valueConst"/device:CPU:0*
dtype0*
_output_shapes
: *
valueB
 *   @
t
b
VariableV2"/device:CPU:0*
dtype0*
_output_shapes
: *
	container *
shape: *
shared_name 
�
b/AssignAssignbb/initial_value"/device:CPU:0*
T0*
_class

loc:@b*
validate_shape(*
_output_shapes
: *
use_locking(
[
b/readIdentityb"/device:CPU:0*
T0*
_class

loc:@b*
_output_shapes
: 
c
c/initial_valueConst"/device:CPU:0*
valueB
 *  @@*
dtype0*
_output_shapes
: 
t
c
VariableV2"/device:CPU:0*
shape: *
shared_name *
dtype0*
_output_shapes
: *
	container 
�
c/AssignAssigncc/initial_value"/device:CPU:0*
T0*
_class

loc:@c*
validate_shape(*
_output_shapes
: *
use_locking(
[
c/readIdentityc"/device:CPU:0*
T0*
_class

loc:@c*
_output_shapes
: 
^

tf_examplePlaceholder"/device:CPU:0*
shape:*
dtype0*
_output_shapes
:
d
ParseExample/ConstConst"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
o
ParseExample/key_x2Const"/device:CPU:0*
valueB*    *
dtype0*
_output_shapes
:
s
ParseExample/Reshape/shapeConst"/device:CPU:0*
valueB:*
dtype0*
_output_shapes
:
�
ParseExample/ReshapeReshapeParseExample/key_x2ParseExample/Reshape/shape"/device:CPU:0*
T0*
Tshape0*
_output_shapes
:
q
ParseExample/ParseExample/namesConst"/device:CPU:0*
valueB *
dtype0*
_output_shapes
: 
w
&ParseExample/ParseExample/dense_keys_0Const"/device:CPU:0*
value	B Bx*
dtype0*
_output_shapes
: 
x
&ParseExample/ParseExample/dense_keys_1Const"/device:CPU:0*
dtype0*
_output_shapes
: *
value
B Bx2
�
ParseExample/ParseExampleParseExample
tf_exampleParseExample/ParseExample/names&ParseExample/ParseExample/dense_keys_0&ParseExample/ParseExample/dense_keys_1ParseExample/ConstParseExample/Reshape"/device:CPU:0*
Tdense
2*
Ndense*:
_output_shapes(
&:���������:���������*
Nsparse *
dense_shapes
::*
sparse_types
 
i
xIdentityParseExample/ParseExample"/device:CPU:0*
T0*'
_output_shapes
:���������
y
zerosConst"/device:CPU:0*%
valueB

*    *
dtype0*&
_output_shapes
:


�
.conv2d/kernel/Initializer/random_uniform/shapeConst*%
valueB"            * 
_class
loc:@conv2d/kernel*
dtype0*
_output_shapes
:
�
,conv2d/kernel/Initializer/random_uniform/minConst*
valueB
 *׳ݿ* 
_class
loc:@conv2d/kernel*
dtype0*
_output_shapes
: 
�
,conv2d/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *׳�?* 
_class
loc:@conv2d/kernel
�
6conv2d/kernel/Initializer/random_uniform/RandomUniformRandomUniform.conv2d/kernel/Initializer/random_uniform/shape*
T0* 
_class
loc:@conv2d/kernel*
seed2 *
dtype0*&
_output_shapes
:*

seed 
�
,conv2d/kernel/Initializer/random_uniform/subSub,conv2d/kernel/Initializer/random_uniform/max,conv2d/kernel/Initializer/random_uniform/min*
T0* 
_class
loc:@conv2d/kernel*
_output_shapes
: 
�
,conv2d/kernel/Initializer/random_uniform/mulMul6conv2d/kernel/Initializer/random_uniform/RandomUniform,conv2d/kernel/Initializer/random_uniform/sub*
T0* 
_class
loc:@conv2d/kernel*&
_output_shapes
:
�
(conv2d/kernel/Initializer/random_uniformAdd,conv2d/kernel/Initializer/random_uniform/mul,conv2d/kernel/Initializer/random_uniform/min*
T0* 
_class
loc:@conv2d/kernel*&
_output_shapes
:
�
conv2d/kernelVarHandleOp"/device:CPU:0*
dtype0*
_output_shapes
: *
shared_nameconv2d/kernel* 
_class
loc:@conv2d/kernel*
	container *
shape:
z
.conv2d/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d/kernel"/device:CPU:0*
_output_shapes
: 
�
conv2d/kernel/AssignAssignVariableOpconv2d/kernel(conv2d/kernel/Initializer/random_uniform"/device:CPU:0* 
_class
loc:@conv2d/kernel*
dtype0
�
!conv2d/kernel/Read/ReadVariableOpReadVariableOpconv2d/kernel"/device:CPU:0* 
_class
loc:@conv2d/kernel*
dtype0*&
_output_shapes
:
�
conv2d/bias/Initializer/zerosConst*
valueB*    *
_class
loc:@conv2d/bias*
dtype0*
_output_shapes
:
�
conv2d/biasVarHandleOp"/device:CPU:0*
dtype0*
_output_shapes
: *
shared_nameconv2d/bias*
_class
loc:@conv2d/bias*
	container *
shape:
v
,conv2d/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d/bias"/device:CPU:0*
_output_shapes
: 
�
conv2d/bias/AssignAssignVariableOpconv2d/biasconv2d/bias/Initializer/zeros"/device:CPU:0*
_class
loc:@conv2d/bias*
dtype0
�
conv2d/bias/Read/ReadVariableOpReadVariableOpconv2d/bias"/device:CPU:0*
_class
loc:@conv2d/bias*
dtype0*
_output_shapes
:
t
conv2d/dilation_rateConst"/device:CPU:0*
valueB"      *
dtype0*
_output_shapes
:
�
conv2d/Conv2D/ReadVariableOpReadVariableOpconv2d/kernel"/device:CPU:0*
dtype0*&
_output_shapes
:
�
conv2d/Conv2DConv2Dzerosconv2d/Conv2D/ReadVariableOp"/device:CPU:0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*&
_output_shapes
:

*
	dilations
*
T0
t
conv2d/BiasAdd/ReadVariableOpReadVariableOpconv2d/bias"/device:CPU:0*
dtype0*
_output_shapes
:
�
conv2d/BiasAddBiasAddconv2d/Conv2Dconv2d/BiasAdd/ReadVariableOp"/device:CPU:0*
T0*
data_formatNHWC*&
_output_shapes
:


{
strided_slice/stackConst"/device:CPU:0*%
valueB"                *
dtype0*
_output_shapes
:
}
strided_slice/stack_1Const"/device:CPU:0*%
valueB"            *
dtype0*
_output_shapes
:
}
strided_slice/stack_2Const"/device:CPU:0*%
valueB"            *
dtype0*
_output_shapes
:
�
strided_sliceStridedSliceconv2d/BiasAddstrided_slice/stackstrided_slice/stack_1strided_slice/stack_2"/device:CPU:0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: *
T0*
Index0
V
MulMula/readx"/device:CPU:0*'
_output_shapes
:���������*
T0
X
AddAddMulb/read"/device:CPU:0*'
_output_shapes
:���������*
T0
a
add_1Addstrided_sliceAdd"/device:CPU:0*
T0*'
_output_shapes
:���������
U
yIdentityadd_1"/device:CPU:0*'
_output_shapes
:���������*
T0
{
zeros_1Const"/device:CPU:0*
dtype0*&
_output_shapes
:

*%
valueB

*    
�
0conv2d_1/kernel/Initializer/random_uniform/shapeConst*
dtype0*
_output_shapes
:*%
valueB"            *"
_class
loc:@conv2d_1/kernel
�
.conv2d_1/kernel/Initializer/random_uniform/minConst*
dtype0*
_output_shapes
: *
valueB
 *׳ݿ*"
_class
loc:@conv2d_1/kernel
�
.conv2d_1/kernel/Initializer/random_uniform/maxConst*
valueB
 *׳�?*"
_class
loc:@conv2d_1/kernel*
dtype0*
_output_shapes
: 
�
8conv2d_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform0conv2d_1/kernel/Initializer/random_uniform/shape*
T0*"
_class
loc:@conv2d_1/kernel*
seed2 *
dtype0*&
_output_shapes
:*

seed 
�
.conv2d_1/kernel/Initializer/random_uniform/subSub.conv2d_1/kernel/Initializer/random_uniform/max.conv2d_1/kernel/Initializer/random_uniform/min*
T0*"
_class
loc:@conv2d_1/kernel*
_output_shapes
: 
�
.conv2d_1/kernel/Initializer/random_uniform/mulMul8conv2d_1/kernel/Initializer/random_uniform/RandomUniform.conv2d_1/kernel/Initializer/random_uniform/sub*
T0*"
_class
loc:@conv2d_1/kernel*&
_output_shapes
:
�
*conv2d_1/kernel/Initializer/random_uniformAdd.conv2d_1/kernel/Initializer/random_uniform/mul.conv2d_1/kernel/Initializer/random_uniform/min*&
_output_shapes
:*
T0*"
_class
loc:@conv2d_1/kernel
�
conv2d_1/kernelVarHandleOp"/device:CPU:0*
dtype0*
_output_shapes
: * 
shared_nameconv2d_1/kernel*"
_class
loc:@conv2d_1/kernel*
	container *
shape:
~
0conv2d_1/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d_1/kernel"/device:CPU:0*
_output_shapes
: 
�
conv2d_1/kernel/AssignAssignVariableOpconv2d_1/kernel*conv2d_1/kernel/Initializer/random_uniform"/device:CPU:0*"
_class
loc:@conv2d_1/kernel*
dtype0
�
#conv2d_1/kernel/Read/ReadVariableOpReadVariableOpconv2d_1/kernel"/device:CPU:0*"
_class
loc:@conv2d_1/kernel*
dtype0*&
_output_shapes
:
�
conv2d_1/bias/Initializer/zerosConst*
valueB*    * 
_class
loc:@conv2d_1/bias*
dtype0*
_output_shapes
:
�
conv2d_1/biasVarHandleOp"/device:CPU:0* 
_class
loc:@conv2d_1/bias*
	container *
shape:*
dtype0*
_output_shapes
: *
shared_nameconv2d_1/bias
z
.conv2d_1/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d_1/bias"/device:CPU:0*
_output_shapes
: 
�
conv2d_1/bias/AssignAssignVariableOpconv2d_1/biasconv2d_1/bias/Initializer/zeros"/device:CPU:0* 
_class
loc:@conv2d_1/bias*
dtype0
�
!conv2d_1/bias/Read/ReadVariableOpReadVariableOpconv2d_1/bias"/device:CPU:0* 
_class
loc:@conv2d_1/bias*
dtype0*
_output_shapes
:
v
conv2d_1/dilation_rateConst"/device:CPU:0*
valueB"      *
dtype0*
_output_shapes
:
�
conv2d_1/Conv2D/ReadVariableOpReadVariableOpconv2d_1/kernel"/device:CPU:0*
dtype0*&
_output_shapes
:
�
conv2d_1/Conv2DConv2Dzeros_1conv2d_1/Conv2D/ReadVariableOp"/device:CPU:0*
paddingVALID*&
_output_shapes
:

*
	dilations
*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(
x
conv2d_1/BiasAdd/ReadVariableOpReadVariableOpconv2d_1/bias"/device:CPU:0*
dtype0*
_output_shapes
:
�
conv2d_1/BiasAddBiasAddconv2d_1/Conv2Dconv2d_1/BiasAdd/ReadVariableOp"/device:CPU:0*
T0*
data_formatNHWC*&
_output_shapes
:


}
strided_slice_1/stackConst"/device:CPU:0*%
valueB"                *
dtype0*
_output_shapes
:

strided_slice_1/stack_1Const"/device:CPU:0*%
valueB"            *
dtype0*
_output_shapes
:

strided_slice_1/stack_2Const"/device:CPU:0*%
valueB"            *
dtype0*
_output_shapes
:
�
strided_slice_1StridedSliceconv2d_1/BiasAddstrided_slice_1/stackstrided_slice_1/stack_1strided_slice_1/stack_2"/device:CPU:0*
end_mask *
_output_shapes
: *
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask 
X
Mul_1Mula/readx"/device:CPU:0*
T0*'
_output_shapes
:���������
\
Add_2AddMul_1c/read"/device:CPU:0*'
_output_shapes
:���������*
T0
e
add_3Addconv2d_1/BiasAddAdd_2"/device:CPU:0*
T0*&
_output_shapes
:


U
y2Identityadd_3"/device:CPU:0*&
_output_shapes
:

*
T0
l
x2IdentityParseExample/ParseExample:1"/device:CPU:0*'
_output_shapes
:���������*
T0
{
zeros_2Const"/device:CPU:0*%
valueB

*    *
dtype0*&
_output_shapes
:


�
0conv2d_2/kernel/Initializer/random_uniform/shapeConst*%
valueB"            *"
_class
loc:@conv2d_2/kernel*
dtype0*
_output_shapes
:
�
.conv2d_2/kernel/Initializer/random_uniform/minConst*
valueB
 *׳ݿ*"
_class
loc:@conv2d_2/kernel*
dtype0*
_output_shapes
: 
�
.conv2d_2/kernel/Initializer/random_uniform/maxConst*
dtype0*
_output_shapes
: *
valueB
 *׳�?*"
_class
loc:@conv2d_2/kernel
�
8conv2d_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform0conv2d_2/kernel/Initializer/random_uniform/shape*
dtype0*&
_output_shapes
:*

seed *
T0*"
_class
loc:@conv2d_2/kernel*
seed2 
�
.conv2d_2/kernel/Initializer/random_uniform/subSub.conv2d_2/kernel/Initializer/random_uniform/max.conv2d_2/kernel/Initializer/random_uniform/min*
T0*"
_class
loc:@conv2d_2/kernel*
_output_shapes
: 
�
.conv2d_2/kernel/Initializer/random_uniform/mulMul8conv2d_2/kernel/Initializer/random_uniform/RandomUniform.conv2d_2/kernel/Initializer/random_uniform/sub*
T0*"
_class
loc:@conv2d_2/kernel*&
_output_shapes
:
�
*conv2d_2/kernel/Initializer/random_uniformAdd.conv2d_2/kernel/Initializer/random_uniform/mul.conv2d_2/kernel/Initializer/random_uniform/min*
T0*"
_class
loc:@conv2d_2/kernel*&
_output_shapes
:
�
conv2d_2/kernelVarHandleOp"/device:CPU:0*
shape:*
dtype0*
_output_shapes
: * 
shared_nameconv2d_2/kernel*"
_class
loc:@conv2d_2/kernel*
	container 
~
0conv2d_2/kernel/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d_2/kernel"/device:CPU:0*
_output_shapes
: 
�
conv2d_2/kernel/AssignAssignVariableOpconv2d_2/kernel*conv2d_2/kernel/Initializer/random_uniform"/device:CPU:0*"
_class
loc:@conv2d_2/kernel*
dtype0
�
#conv2d_2/kernel/Read/ReadVariableOpReadVariableOpconv2d_2/kernel"/device:CPU:0*"
_class
loc:@conv2d_2/kernel*
dtype0*&
_output_shapes
:
�
conv2d_2/bias/Initializer/zerosConst*
valueB*    * 
_class
loc:@conv2d_2/bias*
dtype0*
_output_shapes
:
�
conv2d_2/biasVarHandleOp"/device:CPU:0*
	container *
shape:*
dtype0*
_output_shapes
: *
shared_nameconv2d_2/bias* 
_class
loc:@conv2d_2/bias
z
.conv2d_2/bias/IsInitialized/VarIsInitializedOpVarIsInitializedOpconv2d_2/bias"/device:CPU:0*
_output_shapes
: 
�
conv2d_2/bias/AssignAssignVariableOpconv2d_2/biasconv2d_2/bias/Initializer/zeros"/device:CPU:0* 
_class
loc:@conv2d_2/bias*
dtype0
�
!conv2d_2/bias/Read/ReadVariableOpReadVariableOpconv2d_2/bias"/device:CPU:0* 
_class
loc:@conv2d_2/bias*
dtype0*
_output_shapes
:
v
conv2d_2/dilation_rateConst"/device:CPU:0*
valueB"      *
dtype0*
_output_shapes
:
�
conv2d_2/Conv2D/ReadVariableOpReadVariableOpconv2d_2/kernel"/device:CPU:0*
dtype0*&
_output_shapes
:
�
conv2d_2/Conv2DConv2Dzeros_2conv2d_2/Conv2D/ReadVariableOp"/device:CPU:0*
	dilations
*
T0*
strides
*
data_formatNHWC*
use_cudnn_on_gpu(*
paddingVALID*&
_output_shapes
:


x
conv2d_2/BiasAdd/ReadVariableOpReadVariableOpconv2d_2/bias"/device:CPU:0*
dtype0*
_output_shapes
:
�
conv2d_2/BiasAddBiasAddconv2d_2/Conv2Dconv2d_2/BiasAdd/ReadVariableOp"/device:CPU:0*
T0*
data_formatNHWC*&
_output_shapes
:


}
strided_slice_2/stackConst"/device:CPU:0*%
valueB"                *
dtype0*
_output_shapes
:

strided_slice_2/stack_1Const"/device:CPU:0*
dtype0*
_output_shapes
:*%
valueB"            

strided_slice_2/stack_2Const"/device:CPU:0*%
valueB"            *
dtype0*
_output_shapes
:
�
strided_slice_2StridedSliceconv2d_2/BiasAddstrided_slice_2/stackstrided_slice_2/stack_1strided_slice_2/stack_2"/device:CPU:0*
Index0*
T0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask *
_output_shapes
: 
Y
Mul_2Mula/readx2"/device:CPU:0*
T0*'
_output_shapes
:���������
\
Add_4AddMul_2c/read"/device:CPU:0*
T0*'
_output_shapes
:���������
e
add_5Addconv2d_2/BiasAddAdd_4"/device:CPU:0*
T0*&
_output_shapes
:


U
y3Identityadd_5"/device:CPU:0*&
_output_shapes
:

*
T0
i
ConstConst*4
value+B) B#/tmp/original/export/assets/foo.txt*
dtype0*
_output_shapes
: 
e
filename_tensor/initial_valueConst*
valueB Bfoo.txt*
dtype0*
_output_shapes
: 
s
filename_tensor
VariableV2*
shared_name *
dtype0*
_output_shapes
: *
	container *
shape: 
�
filename_tensor/AssignAssignfilename_tensorfilename_tensor/initial_value*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*"
_class
loc:@filename_tensor
v
filename_tensor/readIdentityfilename_tensor*
_output_shapes
: *
T0*"
_class
loc:@filename_tensor
T
Assign/valueConst*
valueB Bfoo.txt*
dtype0*
_output_shapes
: 
�
AssignAssignfilename_tensorAssign/value*
use_locking( *
T0*"
_class
loc:@filename_tensor*
validate_shape(*
_output_shapes
: 
�
initNoOp	^a/Assign	^b/Assign	^c/Assign^conv2d/bias/Assign^conv2d/kernel/Assign^conv2d_1/bias/Assign^conv2d_1/kernel/Assign^conv2d_2/bias/Assign^conv2d_2/kernel/Assign"/device:CPU:0
�
init_1NoOp	^a/Assign	^b/Assign	^c/Assign^conv2d/bias/Assign^conv2d/kernel/Assign^conv2d_1/bias/Assign^conv2d_1/kernel/Assign^conv2d_2/bias/Assign^conv2d_2/kernel/Assign"/device:CPU:0

init_2NoOp

init_all_tablesNoOp
2
group_deps/NoOpNoOp^init_2^init_all_tables
1
group_deps/NoOp_1NoOp^init_1"/device:CPU:0
8

group_depsNoOp^group_deps/NoOp^group_deps/NoOp_1
*
group_deps_1NoOp^Assign^group_deps
Y
save/filename/inputConst*
dtype0*
_output_shapes
: *
valueB Bmodel
n
save/filenamePlaceholderWithDefaultsave/filename/input*
dtype0*
_output_shapes
: *
shape: 
e

save/ConstPlaceholderWithDefaultsave/filename*
dtype0*
_output_shapes
: *
shape: 
�
save/StringJoin/inputs_1Const*<
value3B1 B+_temp_3956bf0369124229bc239a855889f36d/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
_output_shapes
: *
	separator 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
k
save/ShardedFilename/shardConst"/device:CPU:0*
value	B : *
dtype0*
_output_shapes
: 
�
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards"/device:CPU:0*
_output_shapes
: 
�
save/SaveV2/tensor_namesConst"/device:CPU:0*
dtype0*
_output_shapes
:	*x
valueoBm	BaBbBcBconv2d/biasBconv2d/kernelBconv2d_1/biasBconv2d_1/kernelBconv2d_2/biasBconv2d_2/kernel
�
save/SaveV2/shape_and_slicesConst"/device:CPU:0*%
valueB	B B B B B B B B B *
dtype0*
_output_shapes
:	
�
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesabcconv2d/bias/Read/ReadVariableOp!conv2d/kernel/Read/ReadVariableOp!conv2d_1/bias/Read/ReadVariableOp#conv2d_1/kernel/Read/ReadVariableOp!conv2d_2/bias/Read/ReadVariableOp#conv2d_2/kernel/Read/ReadVariableOp"/device:CPU:0*
dtypes
2	
�
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2"/device:CPU:0*
_output_shapes
: *
T0*'
_class
loc:@save/ShardedFilename
�
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency"/device:CPU:0*
N*
_output_shapes
:*
T0*

axis 
�
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const"/device:CPU:0*
delete_old_dirs(
�
save/IdentityIdentity
save/Const^save/MergeV2Checkpoints^save/control_dependency"/device:CPU:0*
T0*
_output_shapes
: 
�
save/RestoreV2/tensor_namesConst"/device:CPU:0*x
valueoBm	BaBbBcBconv2d/biasBconv2d/kernelBconv2d_1/biasBconv2d_1/kernelBconv2d_2/biasBconv2d_2/kernel*
dtype0*
_output_shapes
:	
�
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*
dtype0*
_output_shapes
:	*%
valueB	B B B B B B B B B 
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*8
_output_shapes&
$:::::::::*
dtypes
2	
�
save/AssignAssignasave/RestoreV2"/device:CPU:0*
use_locking(*
T0*
_class

loc:@a*
validate_shape(*
_output_shapes
: 
�
save/Assign_1Assignbsave/RestoreV2:1"/device:CPU:0*
use_locking(*
T0*
_class

loc:@b*
validate_shape(*
_output_shapes
: 
�
save/Assign_2Assigncsave/RestoreV2:2"/device:CPU:0*
validate_shape(*
_output_shapes
: *
use_locking(*
T0*
_class

loc:@c
_
save/Identity_1Identitysave/RestoreV2:3"/device:CPU:0*
_output_shapes
:*
T0
c
save/AssignVariableOpAssignVariableOpconv2d/biassave/Identity_1"/device:CPU:0*
dtype0
_
save/Identity_2Identitysave/RestoreV2:4"/device:CPU:0*
T0*
_output_shapes
:
g
save/AssignVariableOp_1AssignVariableOpconv2d/kernelsave/Identity_2"/device:CPU:0*
dtype0
_
save/Identity_3Identitysave/RestoreV2:5"/device:CPU:0*
T0*
_output_shapes
:
g
save/AssignVariableOp_2AssignVariableOpconv2d_1/biassave/Identity_3"/device:CPU:0*
dtype0
_
save/Identity_4Identitysave/RestoreV2:6"/device:CPU:0*
T0*
_output_shapes
:
i
save/AssignVariableOp_3AssignVariableOpconv2d_1/kernelsave/Identity_4"/device:CPU:0*
dtype0
_
save/Identity_5Identitysave/RestoreV2:7"/device:CPU:0*
T0*
_output_shapes
:
g
save/AssignVariableOp_4AssignVariableOpconv2d_2/biassave/Identity_5"/device:CPU:0*
dtype0
_
save/Identity_6Identitysave/RestoreV2:8"/device:CPU:0*
T0*
_output_shapes
:
i
save/AssignVariableOp_5AssignVariableOpconv2d_2/kernelsave/Identity_6"/device:CPU:0*
dtype0
�
save/restore_shardNoOp^save/Assign^save/AssignVariableOp^save/AssignVariableOp_1^save/AssignVariableOp_2^save/AssignVariableOp_3^save/AssignVariableOp_4^save/AssignVariableOp_5^save/Assign_1^save/Assign_2"/device:CPU:0
<
save/restore_allNoOp^save/restore_shard"/device:CPU:0"<
save/Const:0save/Identity:0save/restore_all (5 @F8"
asset_filepaths
	
Const:0"�
trainable_variables��
.
a:0a/Assigna/read:02a/initial_value:08
.
b:0b/Assignb/read:02b/initial_value:08
.
c:0c/Assignc/read:02c/initial_value:08
|
conv2d/kernel:0conv2d/kernel/Assign#conv2d/kernel/Read/ReadVariableOp:0(2*conv2d/kernel/Initializer/random_uniform:08
k
conv2d/bias:0conv2d/bias/Assign!conv2d/bias/Read/ReadVariableOp:0(2conv2d/bias/Initializer/zeros:08
�
conv2d_1/kernel:0conv2d_1/kernel/Assign%conv2d_1/kernel/Read/ReadVariableOp:0(2,conv2d_1/kernel/Initializer/random_uniform:08
s
conv2d_1/bias:0conv2d_1/bias/Assign#conv2d_1/bias/Read/ReadVariableOp:0(2!conv2d_1/bias/Initializer/zeros:08
�
conv2d_2/kernel:0conv2d_2/kernel/Assign%conv2d_2/kernel/Read/ReadVariableOp:0(2,conv2d_2/kernel/Initializer/random_uniform:08
s
conv2d_2/bias:0conv2d_2/bias/Assign#conv2d_2/bias/Read/ReadVariableOp:0(2!conv2d_2/bias/Initializer/zeros:08"'
saved_model_main_op

group_deps_1"]
saved_model_assetsG*E
C
+type.googleapis.com/tensorflow.AssetFileDef
	
Const:0foo.txt"�
	variables��
.
a:0a/Assigna/read:02a/initial_value:08
.
b:0b/Assignb/read:02b/initial_value:08
.
c:0c/Assignc/read:02c/initial_value:08
|
conv2d/kernel:0conv2d/kernel/Assign#conv2d/kernel/Read/ReadVariableOp:0(2*conv2d/kernel/Initializer/random_uniform:08
k
conv2d/bias:0conv2d/bias/Assign!conv2d/bias/Read/ReadVariableOp:0(2conv2d/bias/Initializer/zeros:08
�
conv2d_1/kernel:0conv2d_1/kernel/Assign%conv2d_1/kernel/Read/ReadVariableOp:0(2,conv2d_1/kernel/Initializer/random_uniform:08
s
conv2d_1/bias:0conv2d_1/bias/Assign#conv2d_1/bias/Read/ReadVariableOp:0(2!conv2d_1/bias/Initializer/zeros:08
�
conv2d_2/kernel:0conv2d_2/kernel/Assign%conv2d_2/kernel/Read/ReadVariableOp:0(2,conv2d_2/kernel/Initializer/random_uniform:08
s
conv2d_2/bias:0conv2d_2/bias/Assign#conv2d_2/bias/Read/ReadVariableOp:0(2!conv2d_2/bias/Initializer/zeros:08*q
serving_default^

x
x:0���������
y
y:0���������tensorflow/serving/predict*u
regress_x_to_yc

inputs
tf_example:0%
outputs
y:0���������tensorflow/serving/regress*v
regress_x_to_y2c

inputs
tf_example:0%
outputs
y2:0

tensorflow/serving/regress*v
classify_x_to_yc

inputs
tf_example:0$
scores
y:0���������tensorflow/serving/classify*~
regress_x2_to_y3j
%
inputs
x2:0���������%
outputs
y3:0

tensorflow/serving/regress