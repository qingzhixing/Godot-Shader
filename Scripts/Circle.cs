using Godot;
using System;
[Tool]
public partial class Circle : ColorRect
{
	private double radius;
	private const double MIN_RADIUS = 0.05f;
	private const double MAX_RADIUS = 0.45f;
	private double animateTime_s = 1f;
	private bool animateForward = true;
	private double animateTimeElapsed_s = 0f;

	public override void _Ready()
	{
		radius = MIN_RADIUS;
	}

	public override void _Process(double delta)
	{
		animateTimeElapsed_s += (double)delta;
		if (animateTimeElapsed_s >= animateTime_s)
		{
			animateTimeElapsed_s = 0f;
			animateForward = !animateForward;
		}
		double animateProcess = animateTimeElapsed_s / animateTime_s;
		if (animateForward)
		{
			radius = Mathf.Lerp(MIN_RADIUS, MAX_RADIUS, (float)animateProcess);
		}
		else
		{
			radius = Mathf.Lerp(MAX_RADIUS, MIN_RADIUS, (float)animateProcess);
		}

		((ShaderMaterial)Material).SetShaderParameter("radius", radius);
	}

}
