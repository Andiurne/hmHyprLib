{lib}:
{
	bezierRule = point1: point2: {
		type = "bezier";
		points = [
			point1
			point2
		];
	};

	springRule = mass: stiffness: dampening: {
		type = "spring";
		mass = mass;
		stiffness = stiffness;
		dampening = dampening;
	};

	mkCurve = name: rule: {
		_args = [
			name
			rule
		];
	};

	addStyle = animation: style: animation // {style = style;};

	mkAnimation = leaf: speed: curveName:
	  if curveName == "easy" then
	  {
		  leaf = leaf;
		  enabled = true;
		  speed = speed;
		  spring = curveName;
	  }
	  else
	  {
		  leaf = leaf;
		  enabled = true;
		  speed = speed;
		  bezier = curveName;
	  };
}
