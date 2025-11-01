import yaml

def load_env(env="dev"):
    """
    Load environment-specific configuration from YAML files.
    Example usage in Robot: ${config}=    Load Env    dev
    """
    with open(f"config/{env}_variables.yaml") as f:
        return yaml.safe_load(f)
