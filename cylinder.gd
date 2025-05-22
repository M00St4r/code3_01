extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var vertices = PackedVector3Array()
	vertices.push_back(Vector3(0, 0.3, 0))
	vertices.push_back(Vector3(0.3, 0, 0))
	vertices.push_back(Vector3(0, 0, 0.3))

	# Initialize and arrange the data for the single surface
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices

	# Add the data as a surface to the ArrayMesh stored in the mesh property
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
